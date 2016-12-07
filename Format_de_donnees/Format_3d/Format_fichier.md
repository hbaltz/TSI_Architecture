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


