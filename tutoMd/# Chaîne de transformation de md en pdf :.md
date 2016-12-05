# Chaîne de transformation de md en odt/pdf :

## Pré-requis :

Pour convertir un fichier MarkDown vers d'autres formats (possiblement balisés), ou inversement, il est nécessaire d'installer la commande Pandoc (http://pandoc.org/). Elle est déjà disponible dans le répertoire Debian, et peut être installée avec un simple:`
apt-get install pandoc `

Pour passer du .md au .pdf, il faut en outre installer le paquet TexLive, qui permet d'utiliser la commande pdflatex nécessaire à la conversion entre les deux formats.

```
  apt-get install texlive  
  apt-get install texlive-lang-french
```
## Conversion :

La conversion simple d'un fichier markdown vers des formats tels que .txt, .odt, ou .html, passe par la commande:  
`
pandoc fichierEntree.md -o fichierSortie.odt
`
Si des images sont incluses dans le fichier .md, elles doivent être accessibles depuis le même repertoire que le fichier à convertir, pour être prises en charge dans le fichier de sortie.

Pensez à installer :
- [Pandoc](http://pandoc.org/) ;
Pour ce faire, il suffit d'executer la commande 

## Paramètres de la fonction :

### Pour le rapport :
```
	pandoc -N \ 
	       --toc \ <-- Table of Contents
	       --variable documentclass=article \
	       --variable fontsize=12pt \
	       --variable papersize=a4paper \
	       --variable version=0.2.0 \
	       --template="The template in .tex" \ 
	       *.yaml *.md -o "Nom de la sortie.pdf"
```

### Pour la présentation
```
	pandoc --slide-level=2 \
	       --variable theme=Dresden \
	       --variable fontsize=11pt \
	       --variable version=0.1.0 \
	       --template="The template in .tex" \
	       --to=beamer \
	       *.yaml *.md -o "Nom de la sortie.pdf"
```
