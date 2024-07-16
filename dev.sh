#!/bin/sh

export ARTICLE=$(pandoc -f markdown index.md)
envsubst < template.html > index.html

for i in articles/*.md
do
        export ARTICLE=$(pandoc -f markdown "$i")
        envsubst < template.html > "${i%.*}.html"
done

busybox httpd -vfp 8080
