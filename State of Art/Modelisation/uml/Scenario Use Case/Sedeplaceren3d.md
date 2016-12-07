| Scénario                          |                                                                                        | 
|-----------------------------------|----------------------------------------------------------------------------------------| 
| Cas d'utilisation                 | Se déplacer en 3d                                                                      | 
| Acteurs concernés                 | Utilisateur                                                                            | 
| Description succincte             | Déplacement dans tous les sens possibles (rotations et translations)                   | 
|                                   | sur la carte selon les actions de l'utilisateur (drag and drop)                        | 
| Scénario nominal                  | 1. Translation                                                                         | 
|                                   | 1.1. L'utilisateur clique sur le bouton gauche de la souris et la déplace              | 
|                                   | 1.2. Les tuiles se décalent dans le sens contraire de la souris                        | 
|             Scenario_sedeplaceren3d                      | 1.3. L'utilisateur relâche la souris                                                   | 
|                                   | 1.4. Les tuiles non chargées se chargent, en commençant par celles au centre           | 
|                                   | 2. Rotation                                                                            | 
|                                   | 2.1. L'utilisateur clique sur la molette de la souris et la déplace                    | 
|                                   | 2.2. Les tuiles tournent dans la direction du plan normal de la direction de la souris | 
|                                   | 2.3. L'utilisateur relâche la molette                                                  | 
|                                   | 2.4. Les tuiles s'arrêtent (peut-être un fond se charge)                               | 
| Scénarios alternatifs/d'exception | 1.4.a. L'utilisateur se trouve trop proche d'un bâtiment                               | 
|                                   | Le bâtiment n'est pas représenté en 3d                                                 | 
|                                   | 2.4.a. L'utilisateur se trouve trop proche d'un bâtiment                               | 
|                                   | Le bâtiment n'est pas représenté en 3d                                                 | 
| Fin                               |                                                                                        | 
| Post-conditions                   |                                                                                        | 
| Compléments                       | Les solutions techniques (souris et molette ) sont modifiables                         | 

