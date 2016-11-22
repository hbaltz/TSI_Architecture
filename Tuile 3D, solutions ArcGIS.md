####http://www.giscloud.com/blog/realtime-map-tile-rendering-benchmark-rasters-vs-vectors/
*Comparaison des performances entre tuiles raster et tuiles vecteur

###http://www.camptocamp.com/actualite/generation-et-gestion-des-tuiles-cartographiques/
###Enjeux autour de la conception de tuile :
* Gestion du cache de tuiles
* Temps de génération des tuiles
* Stockage des tuiles
* Diversité des infrastructures de données géographiques
* Mise à jour des tuiles

##---------------------------------------------------------------------------------------------------------------

##Beaucoup de documentations ArcGIS sur les tuiles et leur mise en place

###https://pro.arcgis.com/fr/pro-app/help/mapping/map-authoring/author-a-map-for-vector-tile-creation.htm
###Générer une carte pour la création de tuiles vectorielles
* Tuiles vectorielles 3D : représentations vectorielles de données sur une plages d'échelle
* Avantage par rapport au raster : résolution adaptable au périphérique d'affichage et style modifiable
* Création d'une couche de tuiles vectorielles : via la publication d'un paquetage (.vtpk)
* Limite : multi-échelle, pas d'échelle de référence, WGS84
* Carte efficace : données propres, réduire la densité des données en limitant les plages d'échelle visible et par généralisation


###https://pro.arcgis.com/fr/pro-app/tool-reference/data-management/create-vector-tile-package.htm
###Créer un paquetage de tuiles vectorielles
* Système de coordonnées : WGS 1984 Web Mercator
* Métadonnées de la carte en entrée : une description et des balises
* Symbologie : éviter les symboles complexes (hachures, pointillés…)
* Taille : si >2Go, utilisation de l'outil Partager un paquetage


###http://server.arcgis.com/fr/portal/latest/use/vector-tile-layers.htm
###Couches de tuiles vectorielles
* Couche de tuiles vectorielles : ensemble de tuiles
* Avantages : performance d'accès, affichage vectorielle
* Prise en charge : ArcGIS API for JavaScript
* Navigateur : >Explorer 11 et actuelle (Firefox, Chrome, Safari)
