#!/bin/sh

. ./log.sh

info "Rendering markdown files to html..."
for i in ./*.md
do
  ARTICLE=$(pandoc -f markdown "$i")
  export ARTICLE
  envsubst < template.html > "${i%.*}.html"
done
info "HTML files sucessfully created"

