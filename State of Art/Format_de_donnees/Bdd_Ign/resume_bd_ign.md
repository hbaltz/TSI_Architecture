# Résumé analyse des bases de données 3D IGN :

<table>
    <tr>
        <th>Nom de la BD</th>
        <th>Description</th>
    </tr>

    <tr>
		<td><!-- Nom de la BD -->
		    BD TOPO
		</td>
		<td><!-- Description -->
			<ul>
		    	<li>Description vectorielle 3D qui est strucuturée en objets</li>
			<li>Précision métrique</li>
		    	<li>Echelles allant du 1 : 5 000 au 1 : 50 000</li>  
			<li>Projections Lambert-93 (RGF 93) en métropole et UTM (système légal) en outre-mer</li> 
			<li>Découpage départementale et par thème (Administratif (H), Bâti (E), Hydrographie (D), Orographie (G), Réseau routier (A), Toponyme (T), Transport énergie (C), Végétation (F), Voies ferrées et autres (B) et Zone d'activité (I))</li>  
			
			<table>
				<tr>
					<th>Thèmes</th>
					<th>Cocuhes</th>
				</tr>
				<tr>
					<td>Réseau routier (A)</td>
					<td>
						<ul>
							<li>TOPONYME_COMMUNICATION</li>
							<li>SURFACE_ROUTE</li>
							<li>ROUTE_SECONDAIRE</li>
							<li>ROUTE_PRIMAIRE</li>
							<li>ROUTE_NOMMEE</li>
							<li>ROUTE</li>
							<li>CHEMIN</li>
						</ul>
					</td>
				</tr>
				<tr>
				<tr>
					<td>Voies ferrées et autres (B)</td>
					<td>
						<ul>
							<li>TRANSPORT_CABLE</li>
							<li>TOPONYME_FERRE</li>
							<li>GARE</li>
							<li>AIRE_TRIAGE</li>
						</ul>
					</td>
				</tr>
				<tr>
					<td>Transport énergie (C)</td>
					<td>
						<ul>
							<li>PYLONE</li>
							<li>POSTE_TRANSFORMATION</li>
							<li>LIGNE_ELECTRIQUE</li>
							<li>CONDUITE</li>
						</ul>
					</td>
				</tr>
				<tr>
					<td>Hydrographie (D)</td>
					<td>
						<ul>
							<li>TRONCON_COURS_EAU</li>
							<li>SURFACE_EAU</li>
							<li>RESERVOIR_EAU</li>
							<li>POINT_EAU</li>
							<li>HYDRONYME</li>
							<li>CANALISATION_EAU</li>
						</ul>
					</td>
				</tr>
				<tr>
					<td>Bâti (E)</td>
					<td>
						<ul>
							<li>TERRAIN_SPORT</li>
							<li>RESERVOIR</li>
							<li>PISTE_AERODROME</li>
							<li>CONSTRUCTION_SURFACIQUE</li>
							<li>CONSTRUCTION_PONCTUELLE</li>
							<li>CONSTRUCTION_LINEARIE</li>
							<li>CONSTRUCTION_LEGERE</li>
							<li>CIMETIERE</li>
							<li>BATI_REMARQUABLE</li>
							<li>BATI_INDUSTRIEL</li>
							<li>BATI_INDIFERENCIE</li>
						</ul>
					</td>
				</tr>
				<tr>
					<td>Végétation (F)</td>
					<td>
						<ul>
							<li>ZONE_VEGETATION</li>
						</ul>
					</td>
				</tr>
				<tr>
					<td>Orographie (G)</td>
					<td>
						<ul>
							<li>LIGNE_OROGRAPHIQUE</li>
							<li>ORONYME</li>
						</ul>
					</td>
				</tr>
				<tr>
					<td>Administratif (H)</td>
					<td>
						<ul>
							<li>CHEF_LIEU</li>
							<li>COMMUNE</li>
						</ul>
					</td>
				</tr>
				<tr>
					<td>Zone d'activité (I)</td>
					<td>
						<ul>
							<li>PAI_ADMINISTRATIF_MILITAIRE</li>
							<li>PAI_CULTURE_LOISIRS</li>
							<li>PAI_ESPACE_NATUREL</li>
							<li>PAI_GESTION_EAUX</li>
							<li>PAI_HYDROGRAPHIE</li>
							<li>PAI_INDUSTRIEL_COMMERCIAL</li>
							<li>PAI_OROGRAPHIE</li>
							<li>PAI_RELIGIEUX</li>
							<li>PAI_SANTE</li>
							<li>PAI_SCIENCE_ENSEIGNEMENT</li>
							<li>PAI_SPORT</li>
							<li>PAI_TRANSPORT</li>
							<li>PAI_ZONE_HABITATION</li>
							<li>SURFACE_ACTIVITE</li>
						</ul>
					</td>
				</tr>
				<tr>
					<td>Toponyme (T)</td>
					<td>
						<ul>
							<li>LIEU_DIT_HABITE</li>
							<li>LIEU_DIT_NON_HABITE</li>
							<li>TOPONYME_DIVERS</li>
						</ul>
					</td>
				</tr>
			</table>
			
			</ul>
		</td>
    </tr>

    <tr>
		<td><!-- Nom de la BD -->
		    RGE ALTI
		</td>
		<td><!-- Description -->
			<ul>
		    	<li>Description fine du relief</li>  
		    	<li>MNT au pas de 5m</li>  
		    	<li>Créée à partir de données LIDAR</li>  
			</ul>
		</td>
    </tr>

    <tr>
		<td><!-- Nom de la BD -->
		    Litto3D
		</td>
		<td><!-- Description -->
			<ul>
		    	<li>Modèle numérique altimétrique précis continu terre-mer</li>  
			</ul>
		</td>
    </tr>

       <tr>
		<td><!-- Nom de la BD -->
		    BATI-3D
		</td>
		<td><!-- Description -->
			<ul>
		    	<li>Modélisation 3D de haute définition sur les zones urbaines</li>  
			</ul>
		</td>
    </tr>


</table>

## Sources :

http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.106.7153&rep=rep1&type=pdf  
http://www.ign.fr/institut/activites/referentiel-a-grande-echelle  
http://www.esrifrance.fr/sig2009/part_ign.htm  
http://gdr-magis.imag.fr/documents/ap_SIG3D/JourneeSIG3D_2013/APSIG3D_MAGIS_Maillet.pdf  
