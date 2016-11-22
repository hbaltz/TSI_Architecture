# Prise en main d'itowns 

## Qu'est ce qu'itowns
[iTowns](http://www.ign.fr/institut/innovation/itowns) : Une plongée immersive en 3D au cœur de la ville.

iTowns est une plateforme technologique de l’IGN permettant de visualiser et d’exploiter des données géographiques 3D à travers le web.

Cet outil a été développé par l’IGN, initialement pour visualiser les données Street View enregistrées par le véhicule d’acquisition Stéréopolis.

La version 1.0 d’iTowns a été diffusée en OpenSource en février 2016.

iTowns est un cadre de développement écrit en Javascript/WebGL.

Initialement conçue pour visualiser [des données image et laser acquises au niveau de la rue](http://www.ign.fr/institut/innovation/stereopolis), l’application supporte désormais beaucoup d’autres données.

Il est prévu que le client 3D du géoportail soit iTowns pour 2017. 

Tout le projet est en **open source**, les sources sont disponibles [ici](https://github.com/iTowns/itowns2).

## Intelligence collective

Plusieurs entreprises participent au projet :

 - IGN
 - Oslandia
 - AtolCD



## Contacts 

L'équipe de développement d'itowns à l'IGN est très fortement interessée par notre projet. Nous avons rencontré les personnes figurant dans la liste suivante : 

 - Gérald Choqueux (IGN)
 - Victor Coindet (IGN)
 - Quoc-Dinh Nguyen (IGN)
 - Mirela Konini (IGN)

Un [IRC](https://webchat.freenode.net/?channels=itowns) est ouvert pour poser des questions. Les personnes qui y sont connectées sont plutôt dans le genre bien balèze !

Contacter Vincent Picavel (Oslandia) pour plus d'information sur les flux tuilés 3d.

## Données

Le client iTowns gère les formats suivants : 

 - 3dtiles : généré par césium - geojson caché
 - b3d : format de données 3d créé par l'ign

## Branches intéressantes
Il existe deux versions d'iTowns : 

 1. Version 1 :

 Contient beaucoup de fonctionnalités issues du monde de la recherche. Elles servent essentiellement de démonstration. Le développement sur cette version est arrêté.
  

 - 3d immersive sur la branche principale

 3. Version 2 : 

 Branche de développement. Intègre petit à petit les fonctionnalités de la version 1.

 - 3d disponibles dans les branches 
 - [branche 3d-tiles](https://github.com/iTowns/itowns2/tree/3d-tiles) : utilise des tuiles vectorielles 3d
 - [branche wfs2_rebased](https://github.com/iTowns/itowns2/pull/195) : ajout du protocole WFS



## Installation d'iTowns

### Installation de node 

    sudo apt-get install nodejs
    sudo apt-get install npm

#### Configuration du node package manager 

    npm config set proxy http://10.0.4.2:3128
    npm config set https-proxy http://10.0.4.2:3128

### Installation d'iTowns

    git clone http://github.com/iTowns/itowns2
    cd itowns2
    npm install
    npm run build
    npm start
    firefox localhost:8080

## Documentation d'iTowns
Une documentation de certaines fonctionnalités d'iTowns est accessible ici : 
	http://www.itowns-project.org/itowns2/API_Doc/index.html
