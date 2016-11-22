# Summary of Cesium 3D tiles standard proposal

## Context
**Cesium** is an open-source browser-based geospatial visualization engine for 3D globes and maps.

Cesium has previously contributed to a standard : **glTF** (GL Transmission format), described [here](https://github.com/KhronosGroup/glTF/tree/master/specification/1.0). Basically it is a format for the transmission and loading of 3D content. More specifically, it is a WebGL runtime asset format developed by Khronos.

Built on top of glTF, **3D Tile**  is an open specification for streaming massive heterogeneous 3D geospatial datasets. 

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

## Support

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

* **b3dm** for Batched 3D Models (offline batching of heterogeneous 3D models, callable in a single web request, binary format)
* **i3dm** for Instanced 3D Models (large number of models with small variations, like trees in many locations, binary format)
* **pnts** for Point Cloud (massive points clouds, with position and optional properties, binary format)
* **cmpt** for Composite

## Production chain (?)

Geospatial datasets are transformed into 3D Tiles which are then manipulated by 3D engines.