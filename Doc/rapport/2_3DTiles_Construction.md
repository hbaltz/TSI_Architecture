
> **TODO** Introduction (pq BDTopo et 3D Tile)

## From BDTopo to a 3DTile server

In this part, we will focus on how to extract the relevant data from the building set in BDTopo and deal with missing information. The final goal is to fill all the required fields in a 3D Tile.

### Description of BDTopo "Bati"

> **Source** : the BDTopo extract that we have used as a basis for our study is freely available at [IGN](http://professionnels.ign.fr/bdtopo#tab-1), along with a 200pp document describing the source of data and the meaning of each data attribute.

The **"E_BATI"** dataset contains 12 types of buildings (from "industrial" to "graveyard".  They all have the same set of attributes but, for simplicity we only focused on a few buildings. These are : **"BATI_INDUSTRIEL"**, **"BATI_REMARQUABLE"**, **"BATI_INDIFFERENCIE"**, **"CIMETIERE"**, **"LEGERE"**, **"RESERVOIR"**, **"TERRAIN_SPORT"**. 

Definition of the attributes:
- **ID** : unique id 
- **PREC_PLANI** and **PREC_ALTI**: respectifully for the precision in positionning and the precision in altitude. The latter depends on the data source (*cadastre* or other)
- **ORIGIN_BAT**: the origine of the data (example : *cadastre*)
- **HAUTEUR**: heigh of the building
- **Z_MIN** and **Z_MAX**: minimum and maximum height at the gutter level (basically at the base of the roof). For "TERRAIN_SPORT", these fields are replaced by **"Z_MOYEN"**.

> **Note**: The data imported from the *casdastre* have better 2D description and are more detailed than the other data (which have better 3D description and positionning) - *see p82 of BDTOPO_description manual version 2.2*

In addition to those field the BDTopo extract that we have provides a geometry:
- **wkt_geom** : PolygonZ data with (x,y) in the metric system (Lambert93), and z as the height of the building from sea-level. It provides a full description of the bounding upper surface of the object.

The illustration shows all the data available (from the subset of "E_BATI")

> **TODO** illustration

### What is a 3DTile ?

> **Note**: A thorough study of the strengh and current status of Cesium's proposal regarding 3D Tile as a standard can be found in annex (see document: *Summary of Cesium 3D tiles standard proposal*). It also provides links to relevant Cesium webpages.

3DTile is an open source specification built on top of glTF (GL Transmission format). glTF is a very efficient way for transmitting and loading 3D content (as a binary stream). More information can be found in annex : *Description of glTF*.

3D Tile add spatial information and a hierarchisation between objects. For instance, 


### Spatialisation

### How to transform a BDTopo building into a 3D Tile building

####Input Data : the BDTopo
The BDTopo is a Shapefiles group with roads, energy network, hydrography, contructions, vegetation, etc...
We used only some of the contructions Shapefiles as writen before.
So we have seven contructions Shapefiles.
We create a PostGIS database to import all the shapes into a unique table.
After that we can make a preparation with SQL requests, calculate x,y coordinates, made a bounding box for each entity, etc...

The BDTopo Bati entities geometry is **MultiPolygonZM** : a 4D geometry, which is a 3D object (x,y,z), m (measure), the 4th dimension, which can be time or speed.

We simplified the geometry because the 4th dimension have no value and not necessary.
Like all entities are **MultiPolygonZM**, with only on polygon, we can cast it on **PolygonZ** and can simplest process it to made requests.

####Import BDTopo into a PostGIS DB
Importation directly with psql is better way. This is a tool named "shp2psql", which allow this using command line interface.
```
shp2pgsql -S -s 2154 -W "LATIN1" -a file.shp schema.table | psql -d data_base -h host -U user
```
Parameters are : 

####Prepare the data

### Proposition for a hierarchisation of Tiles