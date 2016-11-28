Le modèle de données du réseau routier d’OSM:

Les données OpenStreetMap sont composées de 3 primitives de base :
-Les nœuds (ou « nodes »)
-Les chemins (ou « ways »)
-Les relations
Les nœuds sont la base de toutes les données dans OSM. Ce sont des points, qui peuvent
être isolés pour représenter des points d'intérêt, ou ordonnés dans un chemin, ou encore
associés dans une relation. Par exemple, un panneau de signalisation est considéré comme
un objet ponctuel et peut donc être représentée par un nœud.
Dans le modèle OSM, les chemins sont une suite ordonnée de nœuds. L'ensemble des
nœuds d'un chemin permettent de définir un parcours. Dans cette structure, une rue est par
exemple représentée par un chemin, c'est-à-dire un ensemble de nœuds reliés entre eux.
Chaque nœud peut faire partie de plusieurs chemins. Un nœud dans un chemin n'est pas
forcément, comme en topologie, un point de connexion entre plusieurs chemins. Enfin, un
nœud peut faire partie d'un chemin et avoir sa propre définition. Par exemple un nœud dans
un chemin représentant une rue peut servir à indiquer un feu tricolore ou un point d'arrêt
pour un bus.
Les relations permettent d'associer au sein d'un même objet des nœuds et/ou des chemins
et/ou même d’autres relations. Chaque primitive faisant partie d'une relation peut avoir un
rôle au sein de cette relation. Par exemple on peut associer plusieurs morceaux de rue dans
une relation pour définir une ligne de bus.

Chaque donnée primitive est décrite par un ensemble de couples nom/valeur (ou «
tags/values »). Un tag (ou balise) est un couple nom / valeur.
