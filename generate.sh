#!/bin/sh

ARTICLE=$(pandoc -f markdown index.md)
envsubst < template.html > index.html

for i in articles/*.md
do
	ARTICLE=$(pandoc -f markdown "$i")
	envsubst < template.html > "${i%.*}.html"
done
