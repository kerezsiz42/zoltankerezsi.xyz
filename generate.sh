#!/bin/sh

for i in articles/*.md
do
	pandoc -f markdown "$i" > "${i%.*}.html"
done
