# Installer césium :

* Installer curl :

```
apt-get update
apt-get install curl libcurl3 php5-curl
```

* Installer node :
```
curl -sL https://deb.nodesource.com/setup_6.x | sudo bash -
apt-get install nodejs

```

* Installer npm :
```
apt-get install npm

```

* Cloner cesium :
```
git clone https://github.com/AnalyticalGraphicsInc/cesium.git
```

* Se placer sur la branche 3d-tiles :
```
git checkout 3d-tiles
```

* Lancer l'installation :
```
npm install
```

* Lancer le release :
```
npm run release
```

* Lancer le server :
```
node server.js
```

* Aller sur ```http://localhost:8080/```