#State of the art

Context
-----------

The 3D technology becomes more and more use in different sector. Nowaday the principal and more mediatised use is in 3D in films. Indeed geomaticiens had made complete databases with global description of buildings, furthermore with the BIM( Building information modeling ) we have a affine description of buildings. Obviously geomaticiens had thought to exploit this databases in order to have 3D layers. At first we had interested on Desktop environment and after on web environment. 
At this study we will focus on web environment and especially on creating 3D Tiles from databases and displaying on web.
The main objective of this project is to find a new production chain in order to dislay 3D from IGN database.

Itowns 
---------

" iTowns is a web framework written in Javascript/WebGL for the visualisation of 3D geographic data and precise 3D measurements. It supports a variety of data types, allowing, among other applications, the visualisation of street view images and terrestrial lidar point cloud. " (1)
At first the goal of ITowns was to display imagery from laser scan in streets with "Stéréopolis". Now we think to produce 3D from IGN databases.

Databases
--------------

####IGN databases

We found two interessent databases when we can find 3d informations. The first one is BDUNI, It is a intern database. It is also a contraction BD Carto®, BD Topo® and BD Adresse®. The second one is  BD Topo®  which is more interessebt because we find fields to build 3d models for all types of buildings.



####CityGML

GITYGML is a information modal to represent ubran objects. The main point of this format is the generalization hiearchy of objects. It is a standard of Open Geospatial Consortium, IT is a open data format based on XML.

####OpenStreetMap

OpenStreetMap propose data in two formats to download :	
- osm.pbf
- ShapeFile
OSM datas are organised in XML format with informations relative to objects like bounds or data of objects.

###Three dimension objects 

3D data production techniques are not totally automated, they are based on different sources of data (LIDAR, imagery, etc.) and on various techniques (manual input, automatic elevation calculations, etc.). The diversity of sources, types and techniques leads to diversity in the quality and level of 3D data.

#### COLLADA

COLLADA (COLLAborative Design Activity) is an interchange file format for interactive 3D applications(2). It based on XML standard and open for exchange. It has a specific encoding of different component including the 3d constuction of object.

####Format glTF

The glTF was created by Khronos Group. It was created to be dynamic: the runtime processing for unpacking and using the 3D assets is minimised.
Structure

The glTF format is composed of four files (or types of files).
- .glTF file: This file is based on JSON format with a structure divided in five groups: 1. scenes, nodes, cameras and animations, 2. meshes, textures, images and samplers, 3. buffers, buffers views and accessors, the fourth, materials, techniques, programs and shaders 4. skins.
- The binary file: The .bin file is the geometry and animation file.
- The images (jpg, png, ...): It represents the textures of the model
- The .glsl file: For rendering the models, it needs shader programs contain in this file.


####3D Tiles

3D Tiles are an [open specification](https://github.com/AnalyticalGraphicsInc/3d-tiles) for streaming massive heterogeneous 3D geospatial datasets. To expand on Cesium’s terrain and imagery streaming, 3D Tiles will be used to stream 3D content, including buildings, trees, point clouds, and vector data.
Bringing techniques from graphics research, the movie industry, and the game industry to 3D geospatial, 3D Tiles define a spatial data structure and a set of tile formats designed for 3D and optimized for streaming and rendering. Tiles for 3D models use [glTF](https://www.khronos.org/gltf), the WebGL runtime asset format developed by Khronos, which the Cesium team heavily contributes to.
3D tiles have many advantages than other formats, it is :
-Open
-Optimized for streaming and rendering
-Designed for 3D
-Interactive
-Styleable
-Adaptable
-Flexible
-Heterogeneous
-Precise
-Temporal

###Libraries

To visualize tiles we have to use 3D library. In our study we found many librariries but we kept just Cesium for our production chain. we will introduce also other libraries.

####Mapbox GL JS 

Mapbox GL JS is a JavaScript library that uses the WebGL library. It help to have 3d render from vector tile with a fields of minimum and maximum high.

####Tree.js

Tree.js is a 3D JavaScript library using WebGL. It allows to create scenes, manipulate objects, manage cameras as well as light and render in a web browser. The possible renderings are:
-WebGL,
-CSS3D,
-SVG. It is possible to embed the code in HTML5.

####Cesium

Cesium is a Javascript library for creating 2D and 3D maps. It uses WebGL.
It includes the following data:
-3D Tiles
-WMS
-Tile map service
-OpenGIS Web Map Tile Service
-OpenStreetMap
-Bings Map
-Esri ArcGIS Mapserver
-Google Earth company
-MapBox
-Tile from image

(1) https://www.itowns-project.org/
(2) https://en.wikipedia.org/wiki/COLLADA