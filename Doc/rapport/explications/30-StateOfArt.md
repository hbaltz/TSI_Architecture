# State of the art  
Geomaticians have made complete databases with global description of buildings and, with the BIM (Building information modeling) an affine description of them. Obviously geomaticians have thought to exploit this databases in order to have 3D layers. Indeed, the 3D technology becomes increasingly used in different sector. At first, the interest was on Desktop environment and after on web environment.
In our project, we focused on creating 3D Tiles from IGN databases and displaying them on web and especially with iTowns.

## Itowns  
In our project, iTowns is the client viewer. It is an IGN technology platform for viewing and exploiting 3D geographic data across the web, presented [here](http://www.itowns-project.org/).
This tool was developed by IGN, initially to visualize Street View data recorded by the acquisition vehicle "Stéréopolis".Version 1.0 of iTowns was released in OpenSource in February 2016.
ITowns is a development framework written in Javascript / WebGL. It uses the library [three](https://threejs.org/).
Initially designed to visualize [image and laser data acquired at street level](http://www.ign.fr/institut/innovation/stereopolis), the application now supports many other data.

The 3D geoportal client is expected to be iTowns for 2017.

The project is open-source, the sources are available [here](https://github.com/iTowns/itowns2).

## 3D Tiles  
The principle of tiling is to subdivide the entire surface of a map into small slabs. As part of our project, these slabs will contain layers of vector information i.e. geometric descriptions of points, lines, and surfaces (with respect to the building right-of-way). These tiles must then be stored to be accessible remotely by a client connected to the web. The division is generally done according to a pyramid principle. It can be realized with different GIS tools such as ArcGis or with the GDAL library (function gdal2tiles). Tiling allows two main advantages:

- display on screen only the tiles needed - not the whole map at once - to limit the number of entities to display and thus increase performance in the display. It is also possible to integrate a cache (TileCache) between the server and the client, which makes it possible to keep in memory the tiles already generated, to make it available much faster if the user solicits them again.

- the level of generalization of the information is also adaptable to the level of zoom on the map, in other words: the more one zooms, the more the vectorial information is detailed, and vice versa. This implies, however, that a tiling has been prepared for each zoom level.

> **Useful link** : http://www.arcorama.frhttp://www.arcorama.fr/2016/03/tirer-profit-de-la-puissance-des-tuiles.html/2016/03/tirer-profit-de-la-puissance-des-tuiles.html

## Data

### IGN databases  
BDUni is a database for the production of vector data in France containing all the themes that constitute the commercial products of the IGN such as Carto® BD and the RGE® vector which consists of BD Topo® and BD Address®.
The BDUni regroups the geographical information belonging to 10 domains:
* road network,
* railways and other means of land transport,
* distribution networks,
* terrestrial hydrographic network,
* buildings,
* vegetation,
* orography,
* administrative zoning,
* areas of activity or interest,
* addresses.

The buildings, administrative zoning, areas of activity or interest and addresses domain are potentially apted to exploit the power of 3D Tiles.


### OpenStreetMap database  
[OSM]( https://www.openstreetmap.org/) is a massive data sets. NYC had imported all of it's data into OSM. Its data are available for download, but there is lot of dataset, for that we can use sites for extracts. It propose this data in two formats: osm.pbf and ShapeFile. They are organised in XML format with informations relative to objects like bounds or data of objects.

There is some limits to the utilisation of the OSM data: there is a lot of building parts which don't actually refer back to their parent like they are supposed to do and only a very small percentage of OSM data actually has 3D building metadata.

### 3D format  
3D data production techniques are not totally automated, they are based on different sources of data (LIDAR, imagery, etc.) and on various techniques (manual input, automatic elevation calculations, etc.). The diversity of sources, types and techniques leads to diversity in the quality and level of 3D data.

Plus, a lot of 3D format exists with each their particularities and specifications like CityGML or Collada for example. In constant evolution, we wanted to determine which would be the most relevant to use.

#### CityGML  
[CityGML](http://www.citygmlwiki.org/index.php?title=Citygml_Wiki) is a format of 3D model especially created to represent urban objects, buildings. The main point of this format is the general hiearchy of objects. It is a standard of Open Geospatial Consortium, it is a open data format based on XML. Currently, IGN uses CityGML as 3D standard.

#### COLLADA  
[COLLADA](https://www.khronos.org/collada/) for COLLAborative Design Activity  is an interchange file format for interactive 3D applications. It based on XML standard and open for exchange. It has a specific encoding of different component including the 3d construction of object.

#### Format glTF  
The [glTF](https://github.com/KhronosGroup/glTF) format was created by Khronos Group. It was created to be dynamic: the runtime processing for unpacking and using the 3D assets is minimised.
The glTF format is composed of four files (or types of files).
- .glTF file: this file is based on JSON format with a structure divided in five groups,
- .bin file: this file is the geometry and animation file,
- image file (jpg, png, ...): it represents the textures of the model,
- .glsl file: for rendering the models, it needs shader programs contain in this file.

The glTF format is designed for 3D content transfer. Fast and efficient, it is more dynamic than others 3d formats but it is not a readable human format, even if tools of conversion exist to transform a 3d format (.dae, ...) into glTF.


### 3D Tiles  
Cesium 3D Tiles offers a solution for several questions in 3D like the overlap, but keeps a freedom of use according to the objective of the project.
The 3D Tiles format is a group of tiles organized in tree format. A tile is divided into a tree and each child is completely included in its parent. Splitting into 3D Tiles allows optimal optimization when rendering.
The vector tiles in 3D tiles may include buildings, trees, point clouds and vector data. The tiles use the glTF model, the latter is a transmission format and 3D display that minimizes the size of the 3D tile and at the same time it helps in the use of tiles.
3D tiles are :
- Open
- Optimized for streaming and rendering
- Designed for 3Dhttp://www.arcorama.fr/2016/03/tirer-profit-de-la-puissance-des-tuiles.html
- Interactive
- Styleable
- Adaptable
- Flexible
- Heterogeneous
- Precise
- Temporal

Display and rendering are especially designed for large databases, 3D Tiles allows to load only visible tiles within a requested range.
To reduce queries to WebGL, the developer is asked to group the tiles. Plus, 3D Tiles integrates the different reference systems.

## Existing 3D Solutions  

### ArcGIS API  
Recently, the company ESRI offers an [ArcGIS API](https://developers.arcgis.com/javascript/) for JavaScript 4.0 integrating 3D vector tiles and 3D representation. As we want to use open solutions, ArcGIS solution is not pertinent.

### Mapbox GL JS  
[Mapbox GL JS](https://www.mapbox.com/mapbox-gl-js/api/) is a JavaScript library that uses the WebGL library. It help to have 3d render from vector tile with a fields of minimum and maximum high.

### Three.js  
[Three.js](https://threejs.org/) is a 3D JavaScript library using WebGL. It allows to create scenes, manipulate objects, manage cameras as well as light and render in a web browser.

### Cesium  
[Cesium](https://cesiumjs.org/) is a Javascript library for creating 2D and 3D maps. It uses WebGL.

In the process of our research, we exploited this large spectrum of data and solutions allowing us to provide a chain of production.
