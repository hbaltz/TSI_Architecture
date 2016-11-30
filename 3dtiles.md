#Cesium itself: 3D Tiles
##Cesium
La librairie Cesium est l'une des premières librairies JavaScript dans le domaine de l'espace et la défense. Elle a ainsi dernierement intégrer le domaine des bases de données 3D. Cesium est considéré comme la librairie la plus puissante dans la visualisation du globe.
##Cesium 3D Tiles
Cesium 3 Tiles propose une solution pour plusieurs questions pour la 3D comme le chevauchement, mais garde une liberté d'utilisation de la 3D selon l'objetif du projet.
Le format 3D Tiles est un groupe de tuile organisé sous format d'arbre. Une tuile est divisé en arbre et chaque enfant est complétement inclus dans son parent. La division dans le format 3D Tiles permet une optimisation optimal lors d'un rendu.
Les tuiles vectorielles dans 3D tiles peuvement inclure des batiments, arbres, nauges de points et les données vectorielles. Les tuiles utilisent le modèle glTF, ce dernier est un format de transmission et l'affichage en 3D qui minize la taille de la tuile 3D et au même temps il aide l'utilisation des tuiles.
Les tuiles 3D tiles sont :
-Open source
-Optimisé pour une mise en ligne et un rendu
-Conçu spécialement pour la 3D
-Interactif
-Style configurable
-Adapté 
-Flexible
-Hétérogène 
-Précis
-Temporaire
L'affichage et le rendu sont spécialement conçu pour les grandes bases de données, 3D Tiles permet de charger uniquement les tuiles visible dans étendu demandé.
Pour une réduction de requête vers webGL, le developpeur est invité à grouper les tuiles.
3D Tiles est designé afin de gérer la caméra. Il inégre les différent systèmes de références