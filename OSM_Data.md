#OpenStreetMap - Le format des données

Les données disponibles au téléchargement sont aux formats suivants : 

- osm.pbf
- ShapeFile

Les données sont au format xml.
Il existe deux jeux de données :

- les données **planet**,
- les différentiels **diffs**.

Le **planet** contient l'intégralité des données Monde, les mises à disposition ont lieu chaque semaine.

Les **diffs** ne contiennent que les différences (créations, modifications, suppressions) sur l'ensemble du Monde, ils sont mis à disposition toutes les minutes, heures, jours.

Les fichiers sont compressés. Le **planet** fait une taille de :

- 750GB non compressé,
- 55 GB bz2zippé,
- 35 GB pbf.

##Le format de fichier OSM
Les données sont organisées dans un fichier balisé XML.
Ci-dessous un exemple, avec :

- la version et la référence date et heure *osm*,
- l'emprise des données *bounds*,
- la liste des nœuds *node* avec leurs tags,
- la liste des traces *way* constituées d'un ensemble de nœuds précédemment créés ainsi que des tags.
- les relations *relation* composées de nœuds, de traces.


##Exemple de fichier OSM
	<?xml version='1.0' encoding='UTF-8'?>
	<osm version="0.6" generator="osmconvert 0.8.5" timestamp="2016-11-09T20:28:02Z">
	<bounds minlat="43.72335" minlon="7.409205" maxlat="43.75169" maxlon="7.448637"/>
	<node id="21911883" lat="43.7371175" lon="7.4229093" version="6" timestamp="2012-05-01T15:06:19Z" changeset="11470653" uid="378737" user="Scrup"/>
	...
	<node id="21911886" lat="43.7372399" lon="7.4234985" version="8" timestamp="2012-05-01T15:06:19Z" changeset="11470653" uid="378737" user="Scrup">
		<tag k="highway" v="crossing"/>
		<tag k="crossing_ref" v="zebra"/>
	</node>
	<node id="4437127908" lat="43.7372125" lon="7.4168997" version="1" timestamp="2016-10-08T01:50:09Z" changeset="42725059" uid="42427" user="efes">
		<tag k="addr:city" v="Monaco"/>
		<tag k="addr:housenumber" v="37"/>
		<tag k="addr:postcode" v="98000"/>
		<tag k="addr:street" v="Boulevard du Jardin Exotique"/>
		<tag k="amenity" v="fast_food"/>
		<tag k="cuisine" v="pizza"/>
		<tag k="delivery" v="yes"/>
		<tag k="drive_through" v="yes"/>
		<tag k="name" v="Pizza Boutique"/>
		<tag k="phone" v="+37793308080"/>
		<tag k="takeaway" v="yes"/>
		<tag k="url" v="http://www.pizzaboutique.com"/>
	</node>
	...
	<way id="8056051" version="13" timestamp="2015-07-25T08:49:22Z" changeset="32866762" uid="217070" user="Davio">
		<nd ref="1079750802"/>
		<nd ref="1079751363"/>
		<nd ref="1079751146"/>
		...
		<nd ref="1079751270"/>
		<nd ref="25242953"/>
		<tag k="name" v="Avenue Princesse Grace"/>
		<tag k="lanes" v="2"/>
		<tag k="oneway" v="yes"/>
		<tag k="highway" v="primary"/>
	</way>
	...
	<relation id="2218009" version="23" timestamp="2016-06-08T15:26:06Z" changeset="39887126" uid="2626936" user="jln35">
		<member type="node" ref="1778433992" role=""/>
		<member type="node" ref="25195781" role=""/>
		<member type="node" ref="1690213023" role=""/>
		<member type="way" ref="166399486" role="forward"/>
		<member type="way" ref="68814581" role=""/>
		<member type="way" ref="68814575" role=""/>
		...
		<member type="way" ref="166399489" role=""/>
		<member type="way" ref="94400151" role="forward"/>
		<member type="way" ref="165636038" role="backward"/>
		<member type="way" ref="423632259" role="backward"/>
		<member type="way" ref="166558481" role="forward"/>
		<member type="way" ref="4229893" role="backward"/>
		<member type="way" ref="168681960" role="backward"/>
		<member type="way" ref="4227164" role="forward"/>
		<member type="way" ref="93091315" role="backward"/>
		<member type="way" ref="93091311" role="backward"/>
		<member type="way" ref="93091312" role="forward"/>
		<member type="way" ref="4229274" role="forward"/>
		<tag k="from" v="Hôpital"/>
		<tag k="name" v="Bus 5: Hôpital =&#62; Fontvieille"/>
		<tag k="ref" v="5"/>
		<tag k="route" v="bus"/>
		<tag k="to" v="Fontvieille"/>
		<tag k="type" v="route"/>
	</relation>
	...
	</osm>