# Ecrire la présentation :

## Régles :

* Respecter la structure présente dans exemple/rapport/ : "numero"_"nom_du_doc".md
	*   Commencer une partie par un titre de niveau 1 (souligner par des ===== ou qui commence par #)
	*   Tout les .md doivent contenir un titre de niveau 2
	*   Lorsque qu'un paragraphe (titre de niveau 1) possède plusieurs parties (titre de niveau 2), séparez les titres de niveau 2 ainsi : "numero"_paragrahe-"numero_de_la_partie".md 
	*   Finir le document en sautant une ligne

## Création du pdf :

* Se placer dans le dossier contant les .md (slides)
* Vérifier que pandoc/pandoc.sh est le droit d'exécution (chmod u+x)
* Lancer ```./pandoc/pandoc.sh```
* Le pdf sera créé dans le dossier parent ../

## Template :

* Pandoc se sert du template lateX placé dans le dossier pandoc/
