# Summary of Cesium 3D tiles standard proposal

## Context
**Cesium** is an open-source browser-based geospatial visualization engine for 3D globes and maps (javascript library).

Cesium has previously contributed to a standard : **glTF** (GL Transmission format), described [here](https://github.com/KhronosGroup/glTF/tree/master/specification/1.0). Basically it is a format for the transmission and loading of 3D content. More specifically, it is a WebGL runtime asset format developed by Khronos.

Built on top of glTF, **3D Tile**  is an open specification for streaming massive heterogeneous 3D geospatial datasets. The implementation is open-source.

## Aims (and qualities) of 3D Tiles

> Taken from: [(Blog) Introduction to 3DTiles (August 2015)](http://cesiumjs.org/2015/08/10/Introducing-3D-Tiles/)

* **Open**: open source and open specification
* **Optimized for streaming and rendering**: built ontop of glTF (optimized for streaming), has a spatial data structure that enables Hierarchical Level of Detail (HLOD).
* **Designed for 3D**: full 3D models with meshes, materials, and a node hierarchy. Plus geometric error for Level-Of-Detail (LOD) selection.
* **Interactive**: individual model interaction, metadata
* **Styleable**: metadata for individual models, such as building height or year built
* **Adaptable**:  enable adaptive spatial subdivision in 3D, including k-d trees, quadtrees, octrees, grids, and other spatial data structures. The goal is to have a balanced data structure
* **Flexible**: replacement (as in 2D Tiles) and additive refinement (eg. new buildings).
* **Heterogeneous**: support heterogeneous datasets by enabling adaptive subdivision, flexible refinement, and an extendable set of tile formats. Eg. building and trees, point clouds...
* **Precise**:  full-precision geometry
* **Temporal**:  time-dynamic visualizations (satellite and eventually topography changes (like snow cover))

## Suport

OGC is considering a proposed work item for 3D Tiles as a Community (Release Date: Monday, 29 August 2016 UTC) [Press release](http://www.opengeospatial.org/pressroom/pressreleases/2466)

> Taken from [OpenGeoSpatial announcement](http://www.opengeospatial.org/pressroom/pressreleases/2466)

The initial tile formats are:

* **Batched 3D Models** – for buildings, terrain, massive models, etc.
* **Instanced 3D Models** – for trees, bolts, valves, etc.
* **Point Clouds** – for massive point clouds.
* **Vector Data** – for 3D points, polylines, and polygons, including extrusions.
* **Composite** – a tile of tiles to allow aggregation.

## Specifications

> Taken from [3D Tiles github](https://github.com/AnalyticalGraphicsInc/3d-tiles/blob/master/README.md)

Version: pre-1.0

One specification is falling behind : vector data. The difficulty concerns *cracking* and *morphing* (between tiles). See [issue #25](https://github.com/AnalyticalGraphicsInc/3d-tiles/issues/25).
Otherwise several formats have been defined :

* **b3dm** for Batched 3D Models (offline batching of heterogeneous 3D models, callable in a single web request, binary format, contains glTF)
* **i3dm** for Instanced 3D Models (large number of models with small variations, like trees in many locations, binary format, contains glTF)
* **pnts** for Point Cloud (massive points clouds, with position and optional properties, binary format)
* **cmpt** for Composite (concatenation of heterogenous tiles, binary format)
* **Declarative Styling** contains  tileset features (json format)

Future plans include work on : terrain, OpenStreetMap data (currently done beforehand and not at runtime), Massive model and stars.

### Description of the format

In 3D Tiles, a **tileset** is a set of **tiles** organized in a spatial data structure, the **tree**. A tile references a **feature** or set of features, such as 3D models. The **metadata** for each tile - not the actual contents - are defined in JSON, as well as the tileset.

The *boundingVolume.region* defines the geographic region in radians and meters (for heights). The *geometricError* helps in using **Hierarchical Level of Detail (HLOD)**.  *url* points to binary files containing the model.

Coordinates of tiles within a tileset are local and use a *transform* matrix.

A tileset json description contains properties for the entire tileset, including a *boundingVolume* and a short description of all its children with their own *boundingVolume*. The children can point to another json file.

The creation of spatial structure (hence tilesets and tiles) can use *k-d trees*, *quadtrees*, *octtrees* or *grids*, each having specific strenght depending on the data to represent, the distribution of data and the overlapping of tiles.  The choice will depend on the data.


## Production chain

Geospatial datasets are transformed into 3D Tiles which are then manipulated by 3D engines.

[3D Tiles tools repository](https://github.com/AnalyticalGraphicsInc/3d-tiles-tools) lists tools for processing and converting tilesets. It uses Node.js.
