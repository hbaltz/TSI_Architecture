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
