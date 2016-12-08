##Visualization
In this section, we will describe the process and different parameters used in the visualization of 3d vector tiles.
###Itowns
Oslandia had announced the first release of iTowns, a new 3D geospatial data visualization web framework developed by the iTowns project, including people from French IGN, Oslandia and AtolCD .

iTowns is a web framework written in Javascript/WebGL for visualisation of 3D geographic data, allowing precise measurements in 3D. Its first purpose is the visualisation of street view images and terrestrial lidar point clouds, though it now supports much more data types.

####Technical basis :

- JavaScript
- WebGL
- THREE.JS
- Shaders

→ iTowns : client-side only

Oslandia is working on iTowns to support the GLTF format for 3d data display. Itowns uses a Javascript 3d library called THREE.JS which serves to load glTF format.

###Tileset 
> Taken from: [Tileset](https://github.com/AnalyticalGraphicsInc/3d-tiles/blob/master/README.md) 

A tileset is a set of tiles organized in a spatial data structure, the tree. Each tile has a bounding volume completely enclosing its contents. The tree has spatial coherence; the content for child tiles are completely inside the parent's bounding volume. To allow flexibility, the tree can be any spatial data structure with spatial coherence, including k-d trees, quadtrees, octrees, and grids.

<center>![tree](../images/tree.png)</center>

### LOD
In client side, Level of detail involves decreasing the complexity of a 3D model representation as it moves away from the viewer or according to other metrics such as object importance, viewpoint-relative speed or position. Level of detail techniques increase the efficiency of rendering by decreasing the workload on graphics pipeline stages, usually vertex transformations.

<table border>
<tr>
<th>Level Of Details </th>
<th>LOD 01</th>
<th>LOD 02</th>
<th>LOD 03</th>
<th>LOD 04</th>
</tr>

<tr>
<td><b>Tile structures</td>
<td>3D Building</td>
<td>+ Roofing</td>
<td>+ Texture</td>
<td>+ 3D Object</td>
</tr>

<tr>
<td><b>Required Data</td>
<td>2D frame contour</td>
<td>LOD 01 + Orthophoto HD</td>
<td>LOD 02 + oblique pictures + Detail of facades</td>
<td>LOD 03 + Architect Plans + Field surveys</td>
</tr>

<tr>
<td><b>Optional Data</td>
<td>Textured DMT</td>
<td>Textured DMT</td>
<td>Textured DMT + Breaking lines</td>
<td>Textured DMT + Breaking lines</td>
</tr>

<tr>
<td><b>Applications</td>
<td>Departement: 3D simple - Map of the noises - Flood Map</td>
<td>Agglomeration: Facilities - Modelization - Simulation</td>
<td>City: Urbanism - Communication - Tourism</td>
<td>City Heart: Immersion - Networks - Security</td>
</tr>

</table>



###Process 
When the user launches iTowns, The view is initialized by a global tileset.
The zoom level determines a bounding box of a tileset.

Each tileset is characterized by an identifier which is included in the request with the level of detail LOD. 

The response to the request is a 3dtiles format which contains a gltf file that is required for display and can be loaded using the three.js library: [GLTFLoader.js](https://github.com/mrdoob/three.js/blob/dev/examples/js/loaders/GLTFLoader.js)

The cache contains a copy of the original data when it is expensive to retrieve compared to cache access time. Once some 3d vector tiles are stored in the cache, the client can access them directly through the cache rather than retrieving them by requests, which reduces the access time.

