# BDUNI 
**La BD UNI :** est une base de production de données vecteurs sur la France entière contenant l'ensemble des thèmes qui constituent les produits commerciaux de l'IGN tels que la BD Carto® et le RGE® vecteur qui est constitué de la BD Topo® et de la BD Adresse®. 

##Extension géographique :
La BDUni couvre la France métropolitaine, les DOM Mayotte, Saint-Pierre-et-Miquelon, Saint-Barthélemy et Saint-Martin.

##Contenu de la BD UNI Grande Echelle:
La BDUni regroupe les informations géographiques appartenant à 10 domaines : 
-le réseau routier, 
-les voies ferrées et autres moyens de transport terrestre,
-les réseaux de distribution, 
-le réseau hydrographique terrestre,
-le bâti,
-la végétation,
-l'orographie, 
-les zonages administratifs, 
-les zones d'activité ou d'intérêt,
-les adresses.


##Structure de la BD UNI:
La structure de la BDUni se divise en trois tables attributaires, séparées pour des raisons de performances techniques :
-Deux tables pour chaque classe d'objets :
  Table des objets actuels et des objets supprimés ;
  Table des anciennes versions des objets, ou table d'historique ;
-Une table documentaire, pour tous les domaines, contenant les informations sur les mises à jour considérées par ensembles et appelées réconciliations :Table des réconciliations.

##Classes et qualité des domaines:

<table>
    <tr>
        <th>Domaine</th>
        <th>Classes</th>
        <th>Qualité des données</th>
    </tr>

    <tr>
		<td><!-- Domaine -->
		    Réseau routier
		</td>
		<td><!-- Classes -->
			<ul>
		    	<li>Tronçon de route</li>  
		    	<li>Surface de route</li>  
		    	<li>Route numérotée ou nommée</li>  
		    	<li>Barrière</li>  
			</ul>
		</td>
		<td rowspan="6"><!-- Qualité des données -->
			<ul>
			    	<li>la précision dépend de la source des données</li>  
			    	<li>source de la géométrie 2D et précision planimétrique:  
				   <ul>
				    	<li>BDCarto: 20m </li>
			  		<li>BDNyme: -</li>
				    	<li>BDParcellaire: 5m</li>
				    	<li>BDParcellaire recalée: 3m</li>
				    	<li>BDTopo: 2,5m</li> 
				    	<li>Calculé: 20m</li>  
				    	<li>Fichier numérique métrique: 2,5m</li>  
				    	<li>Fichier numérique non métrique: 5m</li>  
				    	<li>Géoroute : 20m</li>  
				    	<li>Image satellite: 10m</li>  
				    	<li>Levé GPS: 2,5m</li>  
				    	<li>Levé non GPS: 5m</li>  
				    	<li>Orthophotographie: 3m</li>  
				    	<li>Photogrammétrie: 2,5m</li>  
				    	<li>Plan métrique papier: 2,5m</li>
				    	<li>Plan non métrique papier: 5m</li>   
				    	<li> Scan25: 10m</li> 
				   </ul>
				</li> 
<li> la précision altimétrique en fonction de la source Z:
				<li>
				   <ul>
				    	<li>Plan coté: 2m </li>
			  		<li>Fichier numérique: 2m</li>
				    	<li>Levé GPS: 1,5m</li>
				    	<li>Photogrammétrie: 1,5m</li>
				    	<li>Photogrammétrie longue focale: 2,5m</li> 
				    	<li>BDTopo: 1,5m</li>  
				    	<li>Interpolation bâti BDTopo: 3m</li>  
				    	<li>Corrélation: 1m</li> 
				   </ul> 
				</li>      
			</ul>
		</td>
    </tr>
<tr>
		<td><!-- Domaine -->
		    Voies ferrées et autres moyens de transport terrestre
		</td>
		<td><!-- Classes -->
			<ul>
		    	<li>Tronçon de voie ferrée</li>  
		    	<li>Aire de triage</li>  
		    	<li>Transport par câble</li>  
		    	<li>Voie ferrée nommée</li>  
			</ul>
		</td>
    </tr>
    <tr>
		<td><!-- Domaine -->
		    Réseau de distribution
		</td>
		<td><!-- Classes -->
			<ul>
		    	<li>Ligne électrique</li>  
		    	<li>Poste de transformation</li>  
		    	<li>Canalisation</li>  
		    	<li>Pylône</li>  
			</ul>
		</td>
    </tr>
    <tr>
		<td><!-- Domaine -->
		    Hydrographie terrestre
		</td>
		<td><!-- Classes -->
			<ul>
		    	<li>Tronçon de cours d'eau</li>  
		    	<li>Surface  d'eau</li>  
		    	<li>Tronçon de laisse</li>  
		    	<li>Cours d'eau nommé</li>  
			</ul>
		</td>
    </tr>
    <tr>
		<td><!-- Domaine -->
		    Bâti
		</td>
		<td><!-- Classes -->
			<ul>
		    	<li>Bâtiment</li>  
		    	<li>Construction ponctuelle</li>  
		    	<li>Construction linéaire</li>  
		    	<li>Construction surfacique</li>
		    	<li>Réservoir</li>   
		    	<li>Terrain de sport</li>    
		    	<li>Cimetière</li>    
		    	<li>Piste d'aérodrome</li>  
		    	<li>Piste d'aérodrome détaillée</li>      
			</ul>
		</td>
    </tr>
 <tr>
		<td><!-- Domaine -->
		    Végétation
		</td>
		<td><!-- Classes -->
			<ul>
		    	<li>Zone de végétation</li>      
			</ul>
		</td>
    </tr>
 <tr>
		<td><!-- Domaine -->
		    Orographie
		</td>
		<td><!-- Classes -->
			<ul>
		    	<li>Ligne orographique</li> 
		    	<li>Ligne de crête</li>           
			</ul>
		</td>
		<td><!-- Qualité des données -->
		    	<li>précision planimétrique: 3m</li>      
		    	<li>précision altimétrique: 1m</li> 
		</td>     
    </tr>
<tr>
		<td><!-- Domaine -->
		    Zonages administratifs
		</td>
		<td><!-- Classes -->
			<ul>
		    	<li>Commune</li> 
		    	<li>Cas des territoires étrangers</li>  
		    	<li>Limite administrative</li>  
		    	<li>Chef-lieu</li>                                      
			</ul>
		</td>
		<td><!-- Qualité des données -->
		    	<li>précision planimétrique:10 à 25m</li>      
		</td>     
    </tr>
<tr>
		<td><!-- Domaine -->
		    Zone d'activité ou d’intérêt
		</td>
		<td><!-- Classes -->
			<ul>
		    	<li>Équipement administratif ou militaire</li> 
		    	<li>Culture et loisirs</li>  
		    	<li>Espace naturel</li>  
		    	<li>Science et enseignement</li>  
		    	<li>Gestion des eaux</li>  
		    	<li>Industriel ou commercial</li>  
		    	<li>Religieux</li>  
		    	<li>Santé</li> 
		    	<li>Sport</li>  
		    	<li>Transport</li>  
		    	<li>Zone d'habitation</li>  
		    	<li>Hydrographie</li>  
		    	<li>Orographie</li>  
		    	<li>Surface d'activité ou d’intérêt</li>
		    	<li>Surface de parc et de réserve</li>  
			</ul>
		</td>
		<td><!-- Qualité des données -->
		    	<li>la précision planimétrique dépend de la source</li>      
		</td>     
    </tr>
<tr>
		<td><!-- Domaine -->
		    Adresses
		</td>
		<td><!-- Classes -->
			<ul>
		    	<li>Adresse</li> 
			</ul>
		</td>
		<td><!-- Qualité des données -->
		    	<li>précision varie avec le type du géocodage</li>      
		</td>     
    </tr>
</table>


