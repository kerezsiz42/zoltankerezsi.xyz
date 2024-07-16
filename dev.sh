#!/bin/sh

echo "Rendering index.html..."
ARTICLE=$(pandoc -f markdown index.md)
export ARTICLE
envsubst < template.html > index.html

echo "Rendering markdown articles to html..."
for i in articles/*.md
do
  ARTICLE=$(pandoc -f markdown "$i")
  envsubst < template.html > "${i%.*}.html"
done

echo "HTTP server started on http://localhost:8080"
busybox httpd -vfp 8080 &
pid=$!

signal_handler() {
    echo
    echo "Received signal, terminating processes..."
    kill $pid
    wait $pid
    echo "All processes terminated"
    exit 0
}

trap signal_handler INT TERM
wait $pid
exec "$@"
