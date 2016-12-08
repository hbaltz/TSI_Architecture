## From BDTopo to a 3DTile server  
In this part, we will focus on how to extract the relevant data from the building set in BDTopo and deal with missing information. The final goal is to fill all the required fields in a 3D Tile.

### Description of BDTopo "Bati"  
> **Source** : the BDTopo extract that we have used as a basis for our study is freely available at [IGN](http://professionnels.ign.fr/bdtopo#tab-1), along with a 200pp document describing the source of data and the meaning of each data attributes.

The **"E_BATI"** dataset contains 12 types of buildings (from "industrial" to "graveyard").  They all have the same set of attributes but, for simplicity we only focused on a few buildings. These are : **"BATI_INDUSTRIEL"**, **"BATI_REMARQUABLE"**, **"BATI_INDIFFERENCIE"**, **"CIMETIERE"**, **"LEGERE"**, **"RESERVOIR"**, **"TERRAIN_SPORT"**.

Definition of the attributes:
- **ID** : unique id
- **PREC_PLANI** and **PREC_ALTI**: respectfully for the precision in positioning and the precision in altitude. The latter depends on the data source (*cadastre* or other)
- **ORIGIN_BAT**: the origin of the data (example : *cadastre*)
- **HAUTEUR**: height of the building
- **Z_MIN** and **Z_MAX**: minimum and maximum height at the gutter level (basically at the base of the roof). For "TERRAIN_SPORT", these fields are replaced by **"Z_MOYEN"**.

> **Note**: The data imported from the *casdastre* has better 2D description and is more detailed than the other data (which have better 3D description and positioning) - *see p82 of BDTOPO_description manual version 2.2*

In addition to those fields, the BDTopo extract that we have provides a geometry:
- **wkt_geom** : MultiPolygonZM data with (x,y) in the metric system (Lambert93), and z as the height of the building from sea-level. It provides a full description of the bounding upper surface of the object.

The illustration shows all the data available (from the subset of "E_BATI")  
![Buildings in Saint-Nazaire (from BDTopo)](../images/BDTopo_Rendu.png)

### What is a 3DTile ?  
> **Note**: A thorough study of the strenght and current status of Cesium's proposal regarding 3D Tile as a standard can be found in annex (see document: [Summary of Cesium 3D tiles standard proposal](../Annexe/3DTileDefinition.md)). It also provides links to relevant Cesium webpages.

3DTile is an open source specification built on top of glTF (GL Transmission format). glTF is a very efficient way for transmitting and loading 3D content (as a binary stream). More information can be found in annex : [Description of glTF](../Annexes/glTF.md).

3D Tile adds, among other things, spatial information and a hierarchy between objects.

In 3D Tiles, a **tileset** is a set of **tiles** organized in a spatial data structure, the **tree**. A tile references a **feature** or set of features, such as 3D models. The **metadata** for each tile - not the actual contents - are defined in JSON, as well as the tileset.

In summary, one tile description includes:
- a tile.json with a bounding box definition, information necessary to handle a Hierarchical Level of Detail (HLOD).
- a binary file with the description of the object and possibly some textures.

Among the possibilities, **Batched 3D Models** is the best way to describe a building. This format is described in annex : [Description of B3DM](../Annexes/b3dm.md).


### Data hierarchization following the Bounding Volume Hierarchy method  

#### Interest of the method  
The main interest of using a Bounding Volume Hierarchy (BVH) in our workflow lays in the fastening of the geometric processing it allows. Indeed, it is essential that in an interactive web-mapping application, the graphic calculation times are reduced as much as possible, to make its using smoother. Mapping whole cities with their buildings, in 3D, implies complex et heavy data. This data shouldn't be displayed all at once for some obvious reasons of speed and memory performance.

Organizing data with a BVH tree, will rationalize the display, for each level of camera, by prioritizing the data to render. It also gives more cohesiveness to the information. For example, a small-scale point of view (with a weak zoom level) doesn't need to display small and minor geographic objects that would be barely visible and would overload the scene. Some objects also need to get their representation changed as the level of zoom changes too, to stay readable. If we zoom out, a building needs to get its shape generalized, meaning with less details and simplified shapes as the details wouldn't be visible anymore, and to lighten the data as more and more buildings are meant to be displayed as the view enlarges. Sometimes, some geographical objects could even need to be aggregated. The tree structure is, moreover, a far more efficient data organization. That makes each leaf of the tree (individual objects) or intermediate node (group of object) easily reachable via a database request. The complete dataset doesn't need to be read completely, as the right part of the tree can quickly be targeted.  
![BVH](../images/fig03-bvh.png "BVH")

#### Integration in the workflow  
Our workflow follows the processes used by Oslandia, described in this article:
[http://www.isprs-ann-photogramm-remote-sens-spatial-inf-sci.net/IV-2-W1/201/2016/isprs-annals-IV-2-W1-201-2016.pdf](http://www.isprs-ann-photogramm-remote-sens-spatial-inf-sci.net/IV-2-W1/201/2016/isprs-annals-IV-2-W1-201-2016.pdf)

When constructing the 3DTiles dataset, the tiles are linked with the hierarchy. On important thing to care about is the weight of each layer of hierarchy, that must be balanced in comparison with each other. The hierarchic level of each entity in the tree is determined according to its "weight". This weight, can recover multiple definitions depending on programmer choices, mostly in anticipation of who will visualize the data, and for what usage. By default, and without any further information of a possible professional usage, the biggest buildings are generally sent to the higher layers of the hierarchy. But the discretization could also be made according to certain building attributes for example.

In few words: a "weight formula" must have been decided before, to calculate the weight of each element, and assign him a level in the tree. Then, starting from our 3D Tiles database, the idea is to capture the bounding box enclosing the very first level of spatial elements (the most important ones), that will form the root of the tree. After, the tile has to be divided in 4 parts, that will generate the 4 first nodes. In each one of this nodes are assigned the bounding boxes of the entities belonging to the following rank to display. Finally, the parent bounding box (of the the superior level) is extended, so that it can contain the whole of the child bounding boxes. And the display hierarchy is made that way, once the parent bounding box is penetrated, the child bounding boxes start to be displayed. And so on, recursively.

The output must be a 3DTiles database, organized following this structure, ready to be hosted on a server.

### Preliminary steps on BDTOPO data  
In this part, we describe the necessary steps to build a 3D Tile object. First, some preliminary work has to be done to present the data in a usable format. The goal is to be able to automate as mush as possible the process.

#### Input Data : BDTopo  
How to actually create a BDTopo building into a 3D Tile building
BDTopo is a Shapefiles group with roads, energy network, hydrography, constructions, vegetation, etc...

A PostGIS database is created with all the building shapes into a unique table. Then, we can make build a set of SQL request to transform the IGN data into almost ready to use 3DTile data. For instance, a bounding box enclosing the object, coordinates in degrees, etc.

The BDTopo Bati entities geometry type is **MultiPolygonZM**: a 4D geometry, which is a 3D object (x,y,z) and m (for measurement) as a 4th dimension, which can be time or speed.

We simplified the geometry because the 4th dimension have no use for 3D Tiles, and transformed it into a simpler type: **PolygonZ**.

#### Importation into a PostGIS DB  
The best way to import the shapefiles into the postgresql database is "shp2psql", which is in the *postgis* package.
```
shp2pgsql -S -s {SRID} -W "{encoding}" -a file.shp schema.table |
psql -d data_base -h host -U user
```

The created table for *bati* is :
```
CREATE TABLE topo_bati
(
  gid serial NOT NULL,
  id character varying(24),
  geom geometry(PolygonZ,2154),
  prec_plani double precision,
  prec_alti double precision,
  origin_bat character varying(8),
  nature character varying(255) DEFAULT NULL,
  hauteur smallint,
  z_min double precision,
  z_max double precision,
  CONSTRAINT topo_bati_pkey PRIMARY KEY (gid)
)
```

### From a transformed BDTOPO to a set of 3DTiles  
A 3DTile has one description file (in **json** format) and an object file (as a **B3DM** binary file).
The *json* file tells the viewer where to display an object (geolocation), and when to display it (linked to a distance and a point of view). In addition, a **tileset.json** provides an overall description of all the 3D Tiles.

The transformed **BDTOPO** is ready to produce the following informations :

* the bounding box of each entity,
* the entity geometry,
* the entity placement with its bounding box.

**The bounding box**
An object's bounding box is built with *ST_Envelope(geom)*. It must be in degrees system coordinates, so we have to transform the geometry into the target SRID.

The simplest is to build one bounding box per object as shown in the following illustration.  
![Bounding boxes](../images/BDTopo_BB_Rendu.png "Bounding boxes")

**The entity**
We need the geometry in metric system, that is simple with data expressed in *Lambert 93*. A transformation matrix will provide the relative positioning of the geometry inside this bounding box.

**The result format**
This illustration shows the available data (from the subset of "E_BATI")  
![The table bati in database](../images/Topo_Bati_1.png)  
![The table bati in database](../images/Topo_Bati_2.png)

#### Tile metadata (json)

> The **boundingVolume.region** property is an array of six numbers that define the bounding geographic region with the order `[west, south, east, north, minimum height, maximum height]`. Longitudes and latitudes are in radians, and heights are in meters above (or below) the WGS84 ellipsoid. Besides region, other bounding volumes, such as box and sphere, may be used.

	"boundingVolume": {
	    "region": [
	      -1.2419052957251926,
	      0.7395016240301894,
	      -1.2415404171917719,
	      0.7396563300150859,
	      0,
	      20.4
	    ]
	  }

The rectangular bounding box (x,y coordinates) generated in the BDTOPO can be exported along with the **HAUTEUR** field which directly translate into `maximum height`.

In addition, the **boundingVolume** should be bigger than the real size of the building. A constant can be automatically applied.

***

```
"geometricError": 43.88464075650763,
```

> The **geometricError property** is a nonnegative number that defines the error, in meters, introduced if this tile is rendered and its children are not. At runtime, the geometric error is used to compute Screen-Space Error (SSE), i.e., the error measured in pixels. The SSE determines Hierarchical Level of Detail (HLOD) refinement, i.e., if a tile is sufficiently detailed for the current view or if its children should be considered.

In the BDTOPO extract, there is nothing regarding groups of buildings. For instance, in the case of a school with several buildings, we could build a 3D Tile with a single global volume and *children* tiles (see below) with a more precise volume for each building.
The *mother* tile would get a **geometricError** referring to the approximation of the shape.

In our proposition, this value is not used.

***

```
"refine" : "add",
```
>The refine property is a string that is either "replace" for replacement refinement or "add" for additive refinement. It is required for the root tile of a tileset; it is optional for all other tiles. When refine is omitted, it is inherited from the parent tile.

In our case, we will always set this field to **"add"**.

***

```
"content": {
    "boundingVolume": {
      "region": [
			...
      ]
    },
    "url": "2/0/0.b3dm"
  },
```
> The **content** property is an object that contains metadata about the tile's content and a link to the content. **content.url** is a string that points to the tile's contents with an absolute or relative url. In the example above, the url, 2/0/0.b3dm, has a TMS tiling scheme, {z}/{y}/{x}.extension, but this is not required; see the roadmap Q&A.

**"url"** will point to the a bd3m file. The naming scheme comes from the Bounding Volume Hierarchy (BVH) process.

> **content.boundingVolume** defines an optional bounding volume similar to the top-level boundingVolume property. But unlike the top-level boundingVolume property, content.boundingVolume is a tightly fit bounding volume enclosing just the tile's contents.

We won't use **content.boundingVolume** even if it is easy to build - as it will always be similar to the **boundingVolume**.

In **content**, we can add metadata like the origin of the building data or the type of building. The viewer can then interpret that information and use a range of color to display this piece of information.

#### The actual object (B3DM)  
Each B3DM file has a very similar header (**version**, **magic number**...) in addition to the length of the encoded data describing the object, which is in **glTF** format.
Basically, one has to use the geometry (which describe a flat polygon) and the height of the building to generate a set of vertex points and normal vectors.
Since glTF is a well established format it should be relatively easy to adapt an existing library with the BDTOPO inputs.

#### Tileset.json  
The top-level object is basically a "super tile" encompassing all the other tiles.  It has four properties: asset, properties, geometricError, and root.

```
  "asset" : {
    "version": "0.0",
    "tilesetVersion": "e575c6f1-a45b-420a-b172-6449fa6e0a59"
  },
```
This is purely for versioning purpose.
***
```  
  "properties": {
    "Height": {
      "minimum": 1,
      "maximum": 241.6
    }
  },
```
**properties.height** is build from a minimum height (which can't be null) and the height of the highest object.

***
```  
  "geometricError": 494.50961650991815,
```
As with tile.json files, this field value will be arbitrary set.

***
```  
  "root": {
    "boundingVolume": {
      "region": [
        ...
      ]
    },
    "geometricError": 268.37878244706053,
    "content": {
      "url": "0/0/0.b3dm",
      "boundingVolume": {
        "region": [
        ...
        ]
      }
    },
    "children": [..]
  }
}
```
This part is similar to the one in **tile.json**. The **boundingVolume.region** is big enough to encompass all the object in the database. The **url** points to the highest level (see BVH) while the **children** section points to the next level **tile.json** files.

### Server  
All the files (json and B3DM) can be hosted in a database server and the queries will use the embedded BVH structure.
