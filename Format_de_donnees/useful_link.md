# Lien utiles

## Samuel B. 

	http://desktop.arcgis.com/fr/arcmap/latest/extensions/3d-analyst/creating-3d-feature-data.htm
	https://www.safe.com/solutions/for-data-types/3d/
	https://www.quora.com/How-are-the-3D-models-of-buildings-generated-on-Google-Earth
	http://www.gearthblog.com/blog/archives/2014/09/google-earth-automatically-generated-3d-mesh.html


## Victor B.

#### http://wiki.openstreetmap.org/wiki/Simple_3D_buildings
	
Détail de la construction de bâtiments dans OSM grâce aux choix des différents attributs (les bâtiments étant les objets d'une classe).

Par exemple, la forme du toit est un attribut qui peut être plat, pyramidal, mansardé, en dôme...
	
#### http://wiki.openstreetmap.org/wiki/OSM-3D.org#Data_Availability
	
Pour créer de la 3D avec OSM, il faut des fonds de carte OSM accompagnés de MNT SRTM (Shuttle Radar Topography Mission) qui peuvent être fournis par CGIAR.

La combinaison des deux permet d'obtenir un Web Service W3DS qui est censé respecter certains standards (X3D, VRML, Collada, KML).

Les couches de tuiles 3D doivent être dans une projection Mercator.

Les bâtiments doivent être des polyèdres avec une empreinte au sol et un toit plat. Doivent aussi être renseigné les numéros de l'étage le plus bas et de l'étage le plus haut.

#### http://www.w3ds.org/doku.php?id=osm-3d_w3ds
	
Liste de requêtes possibles sur un service W3DS.

#### https://medspx.fr/blog/OpenStreetMap/generation_tuiles_OSM/

Tutoriel pour la création de tuiles vecteurs 2D à partir de données OSM de manière open source. Ce tutoriel détaille notamment les lignes de commandes utiles sous Debian! 

La première étape est la création d'une base POstGIS et l'import de données dans celle-ci. Il faut ensuite Compiler les fichiers carto-css en style MapNik puis déterminer l'emprise géographique à générer et les seuils de zoom. Enfin, il est possible de générer les tuiles et de les visualiser dans QGIS.

#### http://blog.netapsys.fr/open-street-map-partie-2-integration-dune-carte-avec-leaflet/

Tutoriel sur l'utilisation de la librairie leaflet (JavaScript) pour intégrer des cartes sur un site.

A noter qu'il est également fait mention de deux autres bibliothèques connues qui ont le même usage: la librairie de Google liée à Google Maps (https://developers.google.com/maps/)et Open Layers qui permet l’affichage de fonds de carte tuilés (http://openlayers.org/).

## Hugo B.

	http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.106.7153&rep=rep1&type=pdf  
	http://www.loire.gouv.fr/comment-modeliser-un-territoire-en-3d-a893.html  
	http://recherche.ign.fr/labos/cogit/pdf/THESES/BRASEBIN/theseMB-Final.pdf
	
## Mamady S.
	
	http://www.arcorama.fr/2011/06/feature-layers-tuilage-vectoriel.html
