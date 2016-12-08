## The PostgreSQL / PostGIS database

### Shapefile importation
```
shp2pgsql -S -s {SRID} -W "{encoding}" -a file.shp schema.table | psql -d data_base -h host -U user
```

**Parameters for shp2pgsql are :**

* S : generate simple geometries instead of MULTI geometries.
* s {SRID} : specify the SRID
* W {encoding} : encoding The character encoding of Shape's attribute column. (default : "UTF-8")
* c : create a new table and populates it
* a : appends a shapefile into an existing table

**Parameters for psql are :**

* d : database's name
* h : hostname
* U : username

### SQL requests

The geometry conversion :
```
SELECT gid, ST_AsEWKT(ST_Force2D(geom)) AS geom,
hauteur, nature,
ST_X(ST_Force2D((sub.gdump).geom)) AS x,
ST_Y(ST_Force2D((sub.gdump).geom)) AS y
FROM (SELECT *, ST_DumpPoints((geom)) AS gdump FROM topo_bati) AS sub
WHERE (sub.gdump).path[2] = 1
```

A bounding box view :

```
SELECT gid,
ST_AsEWKT(ST_Force2D(geom)) AS geom,
ST_XMin(ST_Force2D((sub.gdump).geom)) AS x,
ST_YMin(ST_Force2D((sub.gdump).geom)) AS y
FROM (SELECT *, ST_DumpPoints(ST_Envelope(geom)) AS gdump FROM topo_bati) AS sub
WHERE (sub.gdump).path[2] = 1
```

**How to prepare the entities**

```
SELECT bati.gid,
ST_Force2D(bati.geom) AS geom,
ST_AsEWKT(ST_Force2D(bati.geom)) AS wkt_geom,
bati.hauteur,
unaccent(bati.nature) AS nature,
ST_X(ST_Force2D((bati.gdump).geom)) AS first_point_x,
ST_Y(ST_Force2D((bati.gdump).geom)) AS first_point_y,
ST_AsEWKT(ST_Force2D(bounding_box.gdump)) AS bb_wkt_geom,
ST_XMin(ST_Force2D(bounding_box.gdump)) AS bb_x_min,
ST_YMin(ST_Force2D(bounding_box.gdump)) AS bb_y_min,
(ST_X(ST_Force2D((bati.gdump).geom)) - ST_XMin(ST_Force2D(bounding_box.gdump)))::real AS delta_x,
(ST_Y(ST_Force2D((bati.gdump).geom)) - ST_YMin(ST_Force2D(bounding_box.gdump)))::real AS delta_y
FROM (SELECT *, ST_DumpPoints(geom) AS gdump FROM topo_bati) AS bati,
(SELECT gid, ST_Envelope(geom) AS gdump FROM topo_bati) AS bounding_box
WHERE bati.gid = bounding_box.gid
AND (bati.gdump).path[2] = 1
```

**The result format**

|gid|geom|wkt_geom|hauteur|nature|
|---|----|--------|-------|------|
|*ID*|*Object's geometry*|*Object's wkt geometry*|*Object's height*|*nature*|

|first_point_x|first_point_y|bb_wkt_geom|
|-------------|-------------|-----------|
|*Object's x first point*|*Object's y first point*|*Bounding box's wkt geometry*|

|bb_x_min|bb_y_min|
|--------|--------|
|*Bounding box x_min*|*Bounding box y min*|
