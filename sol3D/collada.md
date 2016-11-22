###https://www.khronos.org/collada/
###http://edutechwiki.unige.ch/fr/Collada


# Collada 

## Collaborative Design Activity
**COLLADA** a pour but d'établir un format de fichier d'échange pour les applications 3D interactives.
COLLADA définit un standard de schéma XML ouvert pour échanger les acquisitions numériques entre différents types d'applications logicielles graphiques qui pourraient autrement conserver leur acquisition dans des formats incompatibles. ce qui permet de combiner divers outils de création 3D et de traitement de contenu en un pipeline de production. 
Les documents COLLADA, qui décrivent des acquisitions numériques, sont des fichiers XML, habituellement identifiés par leur extension .dae («digital asset exchange», traduit par «échange numérique d'acquisition»).

##Collada, les origines

Créé à l’origine par Sony pour répondre aux besoins de modélisation 3D pour sa Playstation 3 et Playstation Portable.
 Aujourd’hui le format Collada est maintenu par Khronos Group qui continue à partager le copyright avec la firme nippone. 
L’objectif est de créer un outil qui soit compatible avec un maximum d’outils de développement 3D.
Collada vise avec sa structure ouverte et évolutive à devenir le standard des fichiers 3D, remplaçant l’ensemble des formats propriétaires. 
Les logiciels utilisant la modélisation 3D en ont fait leur format de base, comme Google Earth.


## La structure d'un fichier Collada

Le format Collada est structuré autour du format XML. S’appuyant sur une DTD (document type définition) très particulière elle permet à ce format d’être évolutif et un plus ou moins compréhensible.
Le format Collada est assez particulier dans le sens où il déclare un ensemble de points dans l’espace (donc 3 coordonnées) et les assemble après en s’appuyant sur leurs références.

Un fichier Collada se découpe en de grands blocs:
* **Les entêtes XML classiques:**
	<?xml version="1.0" encoding="utf-8"?>
	<COLLADA xmlns="http://www.collada.org/2005/11/COLLADASchema" version="1.4.1">
Il est vital de respecter cette déclaration, sans quoi le fichier Collada ne sera pas correct.

* **Les métadonnées:** 
Ce bloc permet de définir les métadonnées. On définit ainsi l’auteur, la date de création et modification. C’est ici aussi que l’on spécifie l’unité utilisée dans le fichier ainsi que l’axe principal.
  <asset>
    <contributor>
      <author>Nicolas</author>
      <authoring_tool>Maya8.0 | ColladaMaya v3.05B</authoring_tool>
      <source_data>Chemin du fichier</source_data>
    </contributor>
    <created>2009-03-26T15:03:34Z</created>
    <modified>2009-03-26T15:03:34Z</modified>
    <unit meter="0.01" name="centimeter"/>
    <up_axis>Y_UP</up_axis>
  </asset>
Ce bloc est essentiellement informatif et ne constitue pas un élément vital dans la construction 3D.

* **Définition des propriétés physiques de la scène:** 
Dans ce bloc, on définit les informations spécifiques à la scène. On définit avec gravity la force du vecteur original dans la représentation 3D. 
  <library_physics_scenes>
    <physics_scene id="MayaNativePhysicsScene">
      <technique_common>
        <gravity>0 -980 0</gravity>
      </technique_common>
    </physics_scene>
  </library_physics_scenes>

* **Informations sur les matériaux:** 
Dans cet exemple le lambert, cela permet d’effectuer les calculs par rapport aux normales. Le lambert est le format le plus utilisé dans les jeux vidéo et le web 3D. Il existe comme autres matériaux phong et blinn.
  <library_materials>
    <material id="lambert1" name="lambert1">
      <instance_effect url="#lambert1-fx"/>
    </material>
  </library_materials>

* **Définition des effets:** 
Maintenant que l’on a choisi le mode de calcul lambert, On définit les différentes paramètres du mode de calcul (dans cet exemple lambert). Ces paramètres sont emission, ambient, diffuse, transparent et transparency.
Ceux-ci seront utilisés sur l’ensemble de la scène pour réaliser les effets de lumières grâce aux normales.
  <library_effects>
    <effect id="lambert1-fx">
      <profile_COMMON>
        <technique sid="common">
          <lambert>
            <emission>
              <color>0 0 0 1</color>
            </emission>

            <ambient>
              <color>0 0 0 1</color>
            </ambient>

            <diffuse>
              <color>0.6216 0 0.06879 0.8</color>
            </diffuse>

            <transparent opaque="RGB_ZERO">
              <color>0 0 0 1</color>
            </transparent>

            <transparency>
              <float>1</float>
            </transparency>
          </lambert>
          <extra>
            <technique profile="FCOLLADA"/>
          </extra>
        </technique>
      </profile_COMMON>
    </effect>
  </library_effects>

* **Construction de l’objet 3D:** 
* **Déclaration des entêtes:** 
es premiers entêtes pour déclarer un fichier Collada et un objet.
<library_geometries>
    <geometry id="Box01-mesh" name="Box01">
      <mesh>

* **Déclaration des points:** 
        <source id="Box01-mesh-positions">
          <float_array id="Box01-mesh-positions-array" count="24">
             -8.353 -9.42876 0 
             8.353 -9.42876 0 
             -8.353 9.42876 0 
             8.353 9.42876 0 
             -8.353 -9.42876 8.78867 
             8.353 -9.42876 8.78867 
             -8.353 9.42876 8.78867 
             8.353 9.42876 8.78867
          </float_array>
          <technique_common>
            <accessor source="#Box01-mesh-positions-array" count="8" stride="3">
              <param name="X" type="float"/>
              <param name="Y" type="float"/>
              <param name="Z" type="float"/>
            </accessor>
          </technique_common>
        </source>

La source du bloc se trouve entre les balises <source> et </source>. 
On déclare ensuite entre les balises <float_array> et </float_array> les points: sous forme d'une simple liste de coordonnées de la forme : point1_x point1_y point1_z point2_x point2_y point2_z point3_x …

L’organisation de ces points dans le fichier se fait dans les balises <technique_common> et </technique_common> : On crée un accesseur en fonction des positions dans le tableau de points, ceci se fait dans les balises <accessor>, elle prend en attribut:
source qui est une URI faisant référence au tableau de point (« Box01-mesh-positions-array » dans l’exemple).
count qui permet de déterminer le nombre d’accès au tableau (le nombre de points (8 points du cube dans l’exemple).
stride ce paramètre permet de déterminer le nombre de valeurs lues en 1 accès, les points étant composés de 3 coordonnées, chaque accès entraine la lecture de 3 valeurs.
Le paramètre stride détermine que l’on regarde à chaque fois trois valeurs auxqquelles on associe un nom. 

* **Déclaration des normales:** 
La droite normale à une surface en un point est la droite orthogonale au plan tangent en ce point. Chaque sommet (vertex) possède une normale. Elle détermine la façon dont la lumière doit être réfléchie sur la surface (en combinant les 3 normales du triangle). Chaque normale a des coordonnées x, y et z qui détermine la direction que doit prendre la normale. En général, une normale ne prend qu’une seule direction :
(0 1 0) signifie que la normale tend vers l’axe y. Lorsque la source de lumière se situe vers la normale, on éclaire la surface. Lorsqu’on a (0 -1 0), la lumière est absorbée. 
<source id="Box01-mesh-normals">
  <float_array id="Box01-mesh-normals-array" count="72">
            0 0 -1 
            0 0 -1 
            0 0 -1 
            0 0 -1 
            0 0 1 
            0 0 1 
            0 0 1 
            0 0 1 
            0 -1 0 
            0 -1 0 
            0 -1 0 
            0 -1 0 
            1 0 0 
            1 0 0 
            1 0 0 
            1 0 0 
            0 1 0 
            0 1 0 
            0 1 0 
            0 1 0 
            -1 0 0 
            -1 0 0 
            -1 0 0 
            -1 0 0
 </float_array>
 <technique_common>
 <accessor source="#Box01-mesh-normals-array" count="24" stride="3">
              <param name="X" type="float"/>
              <param name="Y" type="float"/>
              <param name="Z" type="float"/>
  </accessor>
 </technique_common>
</source>

* **Déclaration des textures:** 
On déclare  les textures qui doivent être appliquées à chaque face (chaque triangle ou groupe de triangles). Pour chaque triangle, on associe à chaque sommet une coordonnée de texture. 
Une coordonnée de texture correspond à une position dans l’image originelle où se situerait le sommet. 
La coordonnée (0,0) signifie « le coin supérieur gauche de l’image ». 
(1,0) signifie « le coin supérieur droit de l’image » etc.
 On a donc comme valeur pour les coordonnées 0 ou 1.
<source id="Box01-mesh-map-channel1">
 <float_array id="Box01-mesh-map-channel1-array" count="36">
    0 0 0 
    1 0 0 
    0 1 0 
    1 1 0 
    0 0 0 
    1 0 0 
    0 1 0 
    1 1 0 
    0 0 0 
    1 0 0 
    0 1 0 
    1 1 0
 </float_array>
 <technique_common>
   <accessor source="#Box01-mesh-map-channel1-array" count="12" stride="3">
       <param name="S" type="float"/>
       <param name="T" type="float"/>
       <param name="P" type="float"/>
   </accessor>
 </technique_common>
</source>

* **Déclaration des sommets:** 
Ce bloc fait référence à la liste de points déclarés dans la texture, et permet de déclarer que ce sont des sommets. 

<vertices id="Box01-mesh-vertices">
     <input semantic="POSITION" source="#Box01-mesh-positions"/>
</vertices>
* **Déclaration des triangles:** 
On déclare 2 groupements de triangles :
<triangles material="red" count="10">
 <input semantic="VERTEX" source="#Box01-mesh-vertices" offset="0"/>
 <input semantic="NORMAL" source="#Box01-mesh-normals" offset="1"/>
 <input semantic="TEXCOORD" source="#Box01-mesh-map-channel1" offset="2" set="1"/>
          <p>
           0 0 9 
           2 1 11 
           3 2 10 
           3 2 10 
           1 3 8 
           0 0 9 
           0 8 4 
           1 9 5 
           5 10 7 
           5 10 7 
           4 11 6 
           0 8 4 
           1 12 0 
           3 13 1 
           7 14 3 
           7 14 3 
           5 15 2 
           1 12 0 
           3 16 4 
           2 17 5 
           6 18 7 
           6 18 7 
           7 19 6 
           3 16 4 
           2 20 0 
           0 21 1 
           4 22 3 
           4 22 3 
           6 23 2 
           2 20 0
          </p>
</triangles>

 le second groupement de triangles :
<triangles material="yellow" count="2">
 <input semantic="VERTEX" source="#Box01-mesh-vertices" offset="0"/>
 <input semantic="NORMAL" source="#Box01-mesh-normals" offset="1"/>
 <input semantic="TEXCOORD" source="#Box01-mesh-map-channel1" offset="2" set="1"/>
        <p>
          4 4 8 
          5 5 9 
          7 6 11 
          7 6 11 
          6 7 10 
          4 4 8
        </p>
</triangles>

Dans la balise « triangles », on déclare que nous aurons 2 triangles grâce à l’attribut count. (deux triangles pour couvrir une face du cube).
L’attribut semantic avec la valeur VERTEX permet de faire pointer vers l’URI #Box01-mesh-vertices où sont déclarés les sommets. 
l'attribut semantic avec respectivement les valeurs NORMAL et TEXCOORD présente respectivement la lumière et les textures.
En ce qui concerne la construction du triangle, on définit les points entre les balises <p> et </p>. chaque bloc est composé de 3 valeurs :
-La première est la référence vers le vertex (le sommet)
-La seconde, la normale correspondante
-La texture appliquée

* **Fin de la définition de l’objet:** 
    </mesh>
  </geometry>
</library_geometries>

* **Informations de la scène:** 
On définit les axes 
  <library_visual_scenes>
    <visual_scene id="VisualSceneNode" name="untitled">
      <node id="pCube1" name="pCube1" type="NODE">
        <rotate sid="rotateZ">0 0 1 0</rotate>
        <rotate sid="rotateY">0 1 0 0</rotate>
        <rotate sid="rotateX">1 0 0 0</rotate>
        <instance_geometry url="#Box01-mesh">
          <bind_material>
            <technique_common>
              <instance_material symbol="initialShadingGroup" target="#lambert1"/>
            </technique_common>
          </bind_material>
        </instance_geometry>
      </node>
    </visual_scene>
  </library_visual_scenes>

* **Instanciation de la scène:** 
  <scene>
    <instance_physics_scene url="#MayaNativePhysicsScene"/>
    <instance_visual_scene url="#VisualSceneNode"/>
  </scene>

* **Fermetures du fichier:** 
</COLLADA>


