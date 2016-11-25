# Articles

#### Cesium tools/formats

Site : http://cesiumjs.org/presentations/CesiumCzmlGltf.pdf
Date : August 2014

Terrain : quantized-mesh, ArcGIS, VT MÄK VR-TheWorld server 

Imagery : WMS, TMS, OpenStreetMap, Bing Maps, ArcGIS MapServer,  Google Earth Enterprise, WMTS (starting in 1.01) 

Vector data : CZML, GeoJSON, TopoJSON, (KML in progress) 

3D models : glTF (use JSON) 


#### OSM in Cesium

Site : https://cesiumjs.org/presentations/FOSS4GNA2016/OSM.pdf
Date : May 2016

OSM is massive data sets. NYC had imported all of it's data into OSM.
Extract from Mapzen and turned it into 3D Tiles.

Visualize OSM metadata.

Manipulate the height : select color, slider hidding buildings below a certain height.

OSM data available for download, but there is lot of dataset. We can use sites for extracts. 

An OSM pbf reader that will give you JSON  representations of nodes, ways, and relations from OSM, osm-pbf-parser

JSON format contains : 
- type, 
- id, 
- tags, 
- members, 
- info..

Generate collada files
glTF and 3D Tiles

Problems with OSM data : lot of building parts don't actually refer back to  their parent relation like they are supposed to

Take CityGML or KML datasets and turn them into 3D Tiles as well ?

Only a very small percentage of OSM data actually has 3D building metadata. 

#### OSM Buildings for 2.5D and 3D

Site : https://osmbuildings.org/

Use OSM data and convert into a GeoJSON format.

GeoJSON property : 
- height,
- minHeight,
- color/wallColor,
- material,
- roofColor,
- roofMaterial,
- shape,
- roofShape,
- roofHeight

#### OSM

Site : https://www.openstreetmap.org/

Export data of a small area into XML format.

Site : https://openstreetmap.fr/outils

Listing tool, data ...
