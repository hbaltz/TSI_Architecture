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

|gid	|geom	|wkt_geom	|hauteur	|nature	|first_point_x	|first_point_y	|bb_wkt_geom	|bb_x_min	|bb_y_min	|delta_x	|delta_y|
|-------|-------|-------|-------|-------|-------|-------|-------|-------|-------|-------|-------|
||*Object's geometry*|*Object's wkt geometry*|*Object's height*|*nature*|*Object's x first point*|*Object's y first point*|*Bounding box's wkt geometry*|*Bounding box x_min*|*Bounding box y min*|||
|168631|01030000206A...E5941|SRID=2154;POLYGON((305384.7 6699214,305384.1 6699210.9,305381.3 6699210.9,305380.6 6699215,305384.7 6699214))|6||305384.7|6699214|SRID=2154;POLYGON((305380.6 6699210.9,305380.6 6699215,305384.7 6699215,305384.7 6699210.9,305380.6 6699210.9))|305380.6|6699210.9|4.1|3.1|
|168632|	01030000206A...F5941|	SRID=2154;POLYGON((305996.7 6700817.5,305999.1 6700816.7,305997.9 6700812.9,305995.5 6700813.7,305996.7 6700817.5))|5||305996.7|	6700817.5|SRID=2154;POLYGON((305995.5 6700812.9,305995.5 6700817.5,305999.1 6700817.5,305999.1 6700812.9,305995.5 6700812.9))|	305995.5|6700812.9|1.2|4.6|
|168633|	01030000206A...F5941|SRID=2154;POLYGON((305001.4 6700426.5,304998.9 6700427.3,304999.9 6700430.7,305002.6 6700429.5,305001.4 6700426.5))|2||305001.4|6700426.5|SRID=2154;POLYGON((304998.9 6700426.5,304998.9 6700430.7,305002.6 6700430.7,305002.6 6700426.5,304998.9 6700426.5))|304998.9|6700426.5|2.5|0|
|168634|	01030000206A...F5941|SRID=2154;POLYGON((305632 6700309.6,305631.5 6700308.1,305629 6700309,305629.5 6700310.4,305632 6700309.6))|5||305632|6700309.6|SRID=2154;POLYGON((305629 6700308.1,305629 6700310.4,305632 6700310.4,305632 6700308.1,305629 6700308.1))|305629|6700308.1|3|1.5|
