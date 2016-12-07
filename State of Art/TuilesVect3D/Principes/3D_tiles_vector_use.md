#mapzen.com
##Introduction
Le service de tuiles vectorielles permet de dessiner de meilleurs cartes en général. Le service de tuiles vectorielles de Mapzen fournit une couverture mondiale issue des données de couche d'OpenStreetMap.
##URL syntax
Le serveur de tuiles vectorielles Mapzen utilise le format d'URL de la tuile glissante usuelle zoom/x/y:
http://tile.mapzen.com/mapzen/vector/v1/{layers}/{z}/{x}/{y}.{format}?api_key={api_key}
##Formats des données
Sélectionnez le format des tuiles dans l'URL. Plusieurs options sont possibles:

* GeoJSON (lisible et largment utilisé): .json
* TopoJSON (plus léger que GeoJSON): .topojson
* Mapbox Vector Tiles: .mvt
##Services utilisés
Les tuiles vectorielles peuvent être affichées via un certain nombre de technologies à savoir le SVG via D3, OpenLayers et
###Exemples:
####Tangram
[Tangram](https://mapzen.com/products/tangram/) est le moteur cartographique WebGL de Mapzen conçu pour le rendu en temps réel de cartes 2D et 3D à partir de tuiles vectorielles. Plus de détails sont disponibles sur la [page d'accueil Tangram](https://mapzen.com/products/tangram/) ainsi que dans la documentation Tangram.

* [Mapzen House Styles](https://mapzen.com/products/maps/)
####D3
D3 est une bibliothèque de visualisation JS qu'on peut utiliser pour afficher du SVG dans un navigateur. Le d3.geo.til a été adapté [pour afficher les tuiles vectorielles OSM](http://bl.ocks.org/mbostock/5593150). D3 peut utiliser soit GeoJSON, TopoJSON ou mvt. Le style de calque peut être en ligne ou référencé à partir d'un fichier CSS.

* [Full-page D3/SVG demo](http://mapzen.github.io/d3-vector-tiles/)
* [D3/SVG implementation examples](https://github.com/mapzen/d3-vector-tiles)
####OpenLayer
[OpenLayers](http://openlayers.org/) est une bibliothèque JS de haute performance et très complète pour tous les besoins de cartographie. OpenLayers prend en charge les tuiles vectorielles Mapzen au format GeoJSON.

* [Full page OpenLayers demo](https://mapzen.github.io/openlayers-mapzen-vector-tile-example/)
* [OpenLayers implementation example](https://github.com/mapzen/openlayers-mapzen-vector-tile-example/)
####MapboxLG
MapboxGL est une bibliothèque JS utilisée pour afficher le format des tuiles vectorielles Mapbox sur le Web et sur des plateformes d'origine.

* [Full-page MapboxGL demo](https://mapzen.github.io/mapboxgl-vector-tiles/)
* [MapboxGL implementation examples](https://github.com/mapzen/mapboxgl-vector-tiles)

##Remarques sur l'utilisation de tuiles vectorielles

Voici quelques points à prendre en compte si vous utilisez la version actuelle de couches de tuiles vectorielles :

* Les couches de tuiles vectorielles ne sont prises en charge que dans les applications créées avec ArcGIS API for JavaScript. Il peut s'agir d'applications configurables, de Web AppBuilder, et d'applications personnalisées créées avec l'API JavaScript. ArcGIS Runtime SDK intégrera une prise en charge en 2016.
* Vous pouvez afficher des couches de tuiles vectorielles dans Internet Explorer 11 et les versions ultérieures, ainsi que dans la plupart des versions actuelles des navigateurs pour ordinateurs de bureau, tels que Chrome, Firefox et Safari.
* Les performances des couches de tuiles vectorielles sont supérieures sur des machines équipées de matériel plus récent.