#Solutions 3D existantes
##tree.js
Tree.js est une bibliothèque JavaScript 3D utilisant WebGL.
Elle permet de créer des scènes, de manipuler des objets, gérer les caméras ainsi que la lumière et faire un rendu dans un navigateur web.
Les rendus possibles sont :

- webGL,
- CSS3D,
- SVG.
Il est possible d'embarquer le code dans du HTML5.

###Formats d'échange de données avec WebGL
tree.js utilise le format JSON pour communiquer les objets à WebGL.

###Formats de fichiers
tree.js utilise les formats de données :

- obj,
- blender,
- UTF8,
- Collada.

obj semble le meilleur format si l'on recherche la rapidité en utilisant des géométries statiques.
Blender est à privilégier si les données viennent d'un éditeur 3D.

##Parallax
Parallax est une bibliothèque 3D de Google basée sur tree.js.
Afin de garantir une compatibilité avec tree.js, les méthodes ainsi que les objets sont pour la plus part identiques.

##Cesium
Cesium utilise les nouvelles possibilités d'HTML5 et de WebGL.
