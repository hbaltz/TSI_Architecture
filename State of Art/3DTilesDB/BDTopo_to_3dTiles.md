## From BDTopo to 3D Tiles (to be continued)

The "bati" data provides the following intel (from a freely available extract of the data base, on [Ign](http://professionnels.ign.fr/bdtopo#tab-1)):

- **wkt_geom** : PolygonZ data with (x,y) in the metric system (Lambert93), and z as the height of the building from sea-level. It provides a full description of the bounding upper surface of the object.
- **ID** : unique identifier
- **PREC_PLANI** and **PREC_ALTI** respectifully for the precision in poistionning and the precision in altitude. The latter depends on the data source (*cadastre* or not). 
- **NATURE** type of the building
- **HAUTEUR**, **Z_MIN**, **Z_MAX** : use to describe the volume

> *Notes* The data imported from the *casdastre* have better 2D description and are more detailed than the other data (which have better 3D description and positionning) - *see p82 of BDTOPO_description manual version 2.2*

The final result shloud be a number of :
- tileset.json with an "url" point to the b3dm file
- data.b3dm (aka Batched 3D model) describing the buildings

> *Note* : see [Batched colored building example](https://github.com/AnalyticalGraphicsInc/cesium/tree/3d-tiles/Specs/Data/Cesium3DTiles/Batched/BatchedColors) 


### How to create 3D Tiles

#### Tile metadata

The **boundingVolume.region** property is an array of six numbers that define the bounding geographic region with the order `[west, south, east, north, minimum height, maximum height]`. Longitudes and latitudes are in radians, and heights are in meters above (or below) the WGS84 ellipsoid. Besides region, other bounding volumes, such as box and sphere, may be used.
	
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
	
**wkt_geom** can be used to find a rectangular bounding box (x,y coordinates). **HAUTEUR**  directly translate into `maximum height`.

The **boundingVolume** should be bigger than the real size of the building.

***

```
"geometricError": 43.88464075650763,
```

> The **geometricError property** is a nonnegative number that defines the error, in meters, introduced if this tile is rendered and its children are not. At runtime, the geometric error is used to compute Screen-Space Error (SSE), i.e., the error measured in pixels. The SSE determines Hierarchical Level of Detail (HLOD) refinement, i.e., if a tile is sufficiently detailed for the current view or if its children should be considered.

For a first draft, we won't have tiles and children so this value can be dismissed. However we might be able to infer something from **PREC_PLANI** and **PREC_ALTI**.

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


We won't use **"url"**.

> **content.boundingVolume** defines an optional bounding volume similar to the top-level boundingVolume property. But unlike the top-level boundingVolume property, content.boundingVolume is a tightly fit bounding volume enclosing just the tile's contents. 

We won't use **content.boundingVolume** even if it is easy to build from the **wkt_geom** and **HAUTEUR** data.

#### tileset.json

``` 
{
  "asset" : {
    "version": "0.0",
    "tilesetVersion": "e575c6f1-a45b-420a-b172-6449fa6e0a59"
  },
  "properties": {
    "Height": {
      "minimum": 1,
      "maximum": 241.6
    }
  },
  "geometricError": 494.50961650991815,
  "root": {
    "boundingVolume": {
      "region": [
        -0.0005682966577418737,
        0.8987233516605286,
        0.00011646582098558159,
        0.8990603398325034,
        0,
        241.6
      ]
    },
    "geometricError": 268.37878244706053,
    "content": {
      "url": "0/0/0.b3dm",
      "boundingVolume": {
        "region": [
          -0.0004001690908972599,
          0.8988700116775743,
          0.00010096729722787196,
          0.8989625664878067,
          0,
          241.6
        ]
      }
    },
    "children": [..]
  }
}
```
The top-level object in tileset.json has four properties: asset, properties, geometricError, and root.
