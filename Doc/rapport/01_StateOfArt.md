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

###IGN databases

We found two interessent databases when we can find 3d informations. The first one is BDUNI, It is a intern database. It is also a contraction BD Carto®, BD Topo® and BD Adresse®. The second one is  BD Topo®  which is more interessebt because we find fields to build 3d models for all types of buildings.

<table>
    <tr>
        <th>Nom de la BD</th>
        <th>Description</th>
    </tr>

    <tr>
		<td><!-- Nom de la BD -->
		    BD TOPO
		</td>
		<td><!-- Description -->
			<ul>
		    	<li>Description vectorielle 3D qui est strucuturée en objets</li>
			<li>Précision métrique</li>
		    	<li>Echelles allant du 1 : 5 000 au 1 : 50 000</li>  
			<li>Projections Lambert-93 (RGF 93) en métropole et UTM (système légal) en outre-mer</li> 
			<li>Découpage départementale et par thème (Administratif (H), Bâti (E), Hydrographie (D), Orographie (G), Réseau routier (A), Toponyme (T), Transport énergie (C), Végétation (F), Voies ferrées et autres (B) et Zone d'activité (I))</li>  
			
			<table>
				<tr>
					<th>Thèmes</th>
					<th>Cocuhes</th>
				</tr>
				<tr>
					<td>Bâti (E)</td>
					<td>
						<ul>
							<li>TERRAIN_SPORT</li>
							<li>RESERVOIR</li>
							<li>PISTE_AERODROME</li>
							<li>CONSTRUCTION_SURFACIQUE</li>
							<li>CONSTRUCTION_PONCTUELLE</li>
							<li>CONSTRUCTION_LINEARIE</li>
							<li>CONSTRUCTION_LEGERE</li>
							<li>CIMETIERE</li>
							<li>BATI_REMARQUABLE</li>
							<li>BATI_INDUSTRIEL</li>
							<li>BATI_INDIFERENCIE</li>
						</ul>
					</td>
				</tr>

			</table>
</table>


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

####Summarize of 3D objects

| Format  | Langage       | Texture | Bibliothèque | Maillages | Taille | Chargement        | Avantages                                               | Inconvénients                                                | Utilisation       |    
|---------|---------------|---------|--------------|-----------|--------|-------------------|---------------------------------------------------------|--------------------------------------------------------------|----------------------| 
|
| .3ds    | Binaire       | oui     | oui          | triangles | léger  | rapide            | soutenu par de nombreux modeleurs 3D                    | nombre de sommets limités, format de texture limité, etc ... | nombreux domaines    | 
| Collada | xml           | oui     | oui          | polygones | lourd  | lent              | facile à utiliser                                       | fichier volumineux                                           | nombreux domaines    | 
| stl     | Ascii         | non     | oui          | triangles | léger  | rapide            | rapide et compact, soutenu par de nombreux modeleurs 3D | ni texture ni informations de connectivité                   | imprimante 3D        | 
| vtk     | binaire/Ascii | oui     | oui          | polygones | //     | //                | //                                                      | //                                                           | domaine médical      | 
| CityGML | Uml/xml       | oui     | oui          | polygones | //     | niveaux de détail | niveaux de détail                                       | //                                                           | modèle de ville, SIG | 
| ply     | binaire/Ascii | oui     | oui          | polygones | léger  |                   | couleur, transparence, texture                          |                                                              | nombreux domaines    | 
| obj     | C++/OpenGL    | oui     | oui          | polygones |        |                   | connaissances des langages C++ et OpenGL                | faces toujours planes                                        | imprimante 3D        | 
| gltf    | binaire       | oui     | oui          | ?         |        | rapide            | tampons, texture                                        | format nouveau                                               |                      | 
| src     |               | oui     | ?            | polygones | ?      | niveaux de détail |                                                         |                                                              |                      | 

	




(1) http://www.itowns-project.org/
(2) https://en.wikipedia.org/wiki/COLLADA