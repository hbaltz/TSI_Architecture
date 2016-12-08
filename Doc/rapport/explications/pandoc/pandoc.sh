#!/bin/sh
pandoc -N \
       --toc \
       --variable documentclass=article \
       --variable fontsize=12pt \
       --variable papersize=a4paper \
       --variable version=0.2.0 \
       --template=pandoc/template.tex \
       *.yaml *.md -o ../report.pdf
