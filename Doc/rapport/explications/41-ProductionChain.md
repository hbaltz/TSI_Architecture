## Production chain

### Global vision  
Following the various researches, we decide to set up a production chain describing the steps between the input data and the client part.  
![Production chain](../images/Chaine_production.png "Production chain")


Our proposal of chain is to retrieve the 'Bati' data from the BD TOPO and collect all the information we need to create and complete our 3D Tiles in a BVH structure. They are composed of a JSON part and a B3DM part. They describ the properties of the objects and list technicals parameters of the visualisation.
This 3D Tiles will be save in a server. All loaded information by a client will be stock in the cache part in the navigator, in case of reuse. The client part will make request, in order to obtain a visualisation of the data in the zone of interest, at the cache or at the server if the cache does not contain the information. This request takes in account the level of detail and the bounding box.
