# Résumé création de données 3D :

## Technique de produtcion :

Les techniques de produtcion de données 3D ne sont pas totalment automatisée, elles se basent sur différentes sources de données
(LIDAR, imagerie, etc.) et sur diverses techniques (saisie manuelle, calculs automatiques d’élévation, etc.).
La diversité des sources et des techniques conduit à une diversité quand à la qualité et au niveau de étails des données 3D.

## Niveau de détails :

La réglementation concernant la niveau de détails (LOD pour Level Of Detail) est le suivant :

!["LOD-Types"](images/lod-types.jpg) 

## Données disponibles sur le territoire français :

<table>
    <tr>
        <th>LOD</th>
        <th>Moyen d'acquisition</th>
        <th>Exemple</th>
        <th>Emprise</th>
    </tr>

    <tr>
		<td><!-- LOD -->
		    LOD 1
		</td>
		<td><!-- Moyen d'acquisition -->
		    Emprise du bâtiment et information de hauteur  
		</td>
		<td><!-- Exemple -->
		    OSM  
		</td>
		<td><!-- Emprise -->
		   France  
		</td>
    </tr>

    <tr>
		<td><!-- LOD -->
		    LOD 1
		</td>
		<td><!-- Moyen d'acquisition --> 
		    Emprise saisie au contour des gouttières
		</td>
		<td><!-- Exemple -->
		    BD topo
		</td>
		<td><!-- Emprise -->
		   France
		</td>
    </tr>

    <tr>
		<td><!-- LOD -->
		    LOD 2
		</td>
		<td><!-- Moyen d'acquisition --> 
		    Bâtiment avec forme de toit générée
		</td>
		<td><!-- Exemple -->
		    Territoire 3D
		</td>
		<td><!-- Emprise -->
		   France
		</td>
    </tr>

    <tr>
		<td><!-- LOD -->
		    LOD 2
		</td>
		<td><!-- Moyen d'acquisition --> 
		    Bâtiment avec forme de toit automatique
		</td>
		<td><!-- Exemple -->
		    Bati 3D
		</td>
		<td><!-- Emprise -->
		   Commune
		</td>
    </tr>

    <tr>
		<td><!-- LOD -->
		    LOD 2
		</td>
		<td><!-- Moyen d'acquisition --> 
		    Bâtiment avec forme de toit saisie
		</td>
		<td><!-- Exemple -->
		    Bati 3D
		</td>
		<td><!-- Emprise -->
		   Commune
		</td>
    </tr>

    <tr>
		<td><!-- LOD -->
		    LOD 3
		</td>
		<td><!-- Moyen d'acquisition --> 
		    Bâtiment saisie manuellement
		</td>
		<td><!-- Exemple -->
		    Google Warehouse
		</td>
		<td><!-- Emprise -->
		   Quartier, Bâtiments
		</td>
    </tr>

    <tr>
		<td><!-- LOD -->
		    LOD 4
		</td>
		<td><!-- Moyen d'acquisition --> 
		    Bâtiment saisie à partir de plan
		</td>
		<td><!-- Exemple -->
		    Bases locales
		</td>
		<td><!-- Emprise -->
		   Bâtiments
		</td>
    </tr>

</table>

## Disponibilité des données :

La disponibilité des données 3D sur les bâtiments varie en fonction de l'échelle.
Actuellemnt, l'intégralité dess bâtiment sont modélisé en 3D avec un niveau de détail LOD1.
Le niveau LOD2 n'étant que présent dans certaines agglomérations.
Le LOD3-LOD4 étant réservé à certains bâtiments particuliers.

## Sources :

http://recherche.ign.fr/labos/cogit/pdf/THESES/BRASEBIN/theseMB-Final.pdf