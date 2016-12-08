# Ecrire le rapport :

## Régles :

* Respecter la structure présente dans exemple/rapport/ : "numero"_"nom_du_doc".md
	*   Commencer le document par un titre de niveau 1 (souligner par des ===== ou qui commence par #)
	*   Finir le document en sautant une ligne

## Création du pdf :

* Se placer dans le dossier contant les .md (explications)
* Vérifier que pandoc/pandoc.sh est le droit d'exécution (chmod u+x)
* Lancer ```./pandoc/pandoc.sh```
* Le pdf sera créé dans le dossier parent ../

## Template :

* Pandoc se sert du template lateX placé dans le dossier pandoc/
