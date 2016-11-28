# Lien utiles

## Samuel B. 

### http://desktop.arcgis.com/fr/arcmap/latest/extensions/3d-analyst/creating-3d-feature-data.htm

ArcGis offre la possibilité de créer des scènes, pour présenter des données en 3D de manière immersive. Pour les projets ayant trait à l'environnement urbain et à la modélisation du bâti, il est possible de créer des scènes affichant les tuiles de données sur une surface plane et délimitée, en s'appuyant sur des systèmes de coordonnées locaux (et non en WGS84 avec une projection sur un globe comme pour les scènes globales).

Il existe deux principales manières de faire de la 3D sous ArcGis. La première consiste à plaquer des données 2D sur un modèle numérique de terrain (MNT). Les entités de la couche 2D adoptent alors l'altitude du MNT à l'endroit de leur implantation, ce qui donne donc un effet de tridimentionnalité. 

Un autre moyen est celui d'intégrer directement une troisième dimension *z* en plus des traditionnelles coordonnées *(x,y)* correspondant respectivement aux axes vertical et longitudinal en 2D. Les coordonnées en *z* correspondent généralement à l'altitude. Les entités auront alors une représentation géométrique propre en 3D. Il est par exemple possible d'élever les bâtiments jusqu'à leur hauteur *z*, à partir de leur emprise au sol en *x* et *y* grâce à la fonction *Extrusion*.

### https://www.safe.com/solutions/for-data-types/3d/
	
### https://www.quora.com/How-are-the-3D-models-of-buildings-generated-on-Google-Earth
### http://www.gearthblog.com/blog/archives/2014/09/google-earth-automatically-generated-3d-mesh.html

Posts à propos de la manière dont la 3D est générée dans Google Earth. 

Tout d'abord au moyen du logiciel SketchUp 3D, qui permet de modéliser très en détail des bâtiments, les utilisateurs pouvaient recréer des bâtiments compatibles avec le format de Google Earth, et les y voir intégrer après validation par les équipes de Google. Ce mode de représentation, d'une grande précision, implique toutefois un travail manuel important qui ne peut raisonnablemennt pas être délpoyée à l'ensemble de la surface terrestre mais est resté cantonné à certains bâtiments ciblés.

Pour gagner en efficacité et améliorer sa couverture 3D, Google s'est à partir de 2012 penché sur un mode automatisé de mise à jour du relief des zones bâties au moyen de la stéréophotogramétrie. Cette sous-discipline de la photogramétrie vise à recomposer le relief des bâtiments par triangulation, en comparant leurs surfaces sous différents angles de prise de vue aérienne. En 2016,  un total de 495 000 km2 est couvert en 3D par Google Earth.

### https://help.sketchup.com/fr/article/3000149
Documentation du logiciel de dessin Sketchup 3D, qui rappelle quelques bonnes pratiques dans la modélisation des bâtiments en 3D. Il est important d'optimiser au maximum le poids des données créées. Dans cette optique, il est par exemple plus intéressant de simplifier au maximum les contours des bâtiments, et de priviliégier la projection de textures à la surface des bâtiments à partir d'images les plus légères possibles. Intégrer des espaces vides lorsque le bâtiment n'est pas totalement opaque, ou bien géolocaliser le bâtiment sont également des points importants.

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

A noter qu'il est également fait mention de deux autres bibliothèques connues qui ont le même usage: la librairie de Google liée à Google Maps (https://developers.google.com/maps/) et Open Layers qui permet l’affichage de fonds de carte tuilés (http://openlayers.org/).

## Hugo B.

	http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.106.7153&rep=rep1&type=pdf  
	http://www.loire.gouv.fr/comment-modeliser-un-territoire-en-3d-a893.html  
	http://recherche.ign.fr/labos/cogit/pdf/THESES/BRASEBIN/theseMB-Final.pdf
	
## Mamady S.
	
	http://www.arcorama.fr/2011/06/feature-layers-tuilage-vectoriel.html
