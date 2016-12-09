### https://www.khronos.org/collada/
### http://edutechwiki.unige.ch/fr/Collada


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

* **Les métadonnées:**
Ce bloc permet de définir les métadonnées. On définit ainsi l’auteur, la date de création et modification. C’est
Ce bloc est essentiellement informatif et ne constitue pas un élément vital dans la construction 3D.

* **Définition des propriétés physiques de la scène:**
Dans ce bloc, on définit les informations spécifiques à la scène. On définit avec gravity la force du vecteur original dans la représentation 3D.

* **Informations sur les matériaux:**
Le lambert est le format le plus utilisé dans les jeux vidéo et le web 3D. Il existe comme autres matériaux phong et blinn.

* **Définition des effets:**
On définit les différentes paramètres du mode de calcul. Ces paramètres sont emission, ambient, diffuse, transparent et transparency.
Ceux-ci seront utilisés sur l’ensemble de la scène pour réaliser les effets de lumières grâce aux normales.

* **Construction de l’objet 3D:**
* **Déclaration des entêtes:**
les premiers entêtes pour déclarer un fichier Collada et un objet.

* **Déclaration des points:**
La source du bloc se trouve entre les balises source.
On déclare ensuite entre les balises float_array les points: sous forme d'une simple liste de coordonnées de la forme : point1_x point1_y point1_z point2_x point2_y point2_z point3_x …

L’organisation de ces points dans le fichier se fait dans les balises technique_common: On crée un accesseur en fonction des positions dans le tableau de points, ceci se fait dans les balises accessor, elle prend en attribut:
-source qui est une URI faisant référence au tableau de point.
-count qui permet de déterminer le nombre d’accès au tableau (le nombre de points).
-stride ce paramètre permet de déterminer le nombre de valeurs lues en 1 accès, les points étant composés de 3 coordonnées, chaque accès entraine la lecture de 3 valeurs.
Le paramètre stride détermine que l’on regarde à chaque fois trois valeurs auxqquelles on associe un nom.

* **Déclaration des normales:**
La droite normale à une surface en un point est la droite orthogonale au plan tangent en ce point. Chaque sommet (vertex) possède une normale. Elle détermine la façon dont la lumière doit être réfléchie sur la surface (en combinant les 3 normales du triangle). Chaque normale a des coordonnées x, y et z qui détermine la direction que doit prendre la normale. En général, une normale ne prend qu’une seule direction :
(0 1 0) signifie que la normale tend vers l’axe y. Lorsque la source de lumière se situe vers la normale, on éclaire la surface. Lorsqu’on a (0 -1 0), la lumière est absorbée.

* **Déclaration des textures:**
On déclare  les textures qui doivent être appliquées à chaque face (chaque triangle ou groupe de triangles). Pour chaque triangle, on associe à chaque sommet une coordonnée de texture.
Une coordonnée de texture correspond à une position dans l’image originelle où se situerait le sommet.
La coordonnée (0,0) signifie « le coin supérieur gauche de l’image ».
(1,0) signifie « le coin supérieur droit de l’image » etc.
 On a donc comme valeur pour les coordonnées 0 ou 1.

* **Déclaration des sommets:**
Ce bloc fait référence à la liste de points déclarés dans la texture, et permet de déclarer que ce sont des sommets.

* **Déclaration des triangles:**
Dans la balise « triangles », on déclare que nous aurons 2 triangles grâce à l’attribut count.
L’attribut semantic avec la valeur VERTEX permet de faire pointer vers l’URI où sont déclarés les sommets.
l'attribut semantic avec respectivement les valeurs NORMAL et TEXCOORD présente respectivement la lumière et les textures.
En ce qui concerne la construction du triangle, on définit les points entre les balises p. Chaque bloc est composé de 3 valeurs :
-La première est la référence vers le vertex (le sommet)
-La seconde, la normale correspondante
-La texture appliquée

* **Fin de la définition de l’objet:**

* **Informations de la scène:**
On définit les axes
* **Instanciation de la scène:**

* **Fermetures du fichier:**
</COLLADA>
