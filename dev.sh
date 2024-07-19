#!/bin/sh

info() {
  >&2 printf "%s [\033[34mINFO\033[0m] %s\n" "$(date --iso-8601=seconds)" "$1"
}

info "Rendering markdown files to html..."
for i in ./*.md
do
  ARTICLE=$(pandoc -f markdown "$i")
  export ARTICLE
  envsubst < template.html > "${i%.*}.html"
done

info "HTTP server started on http://localhost:8080"
busybox httpd -vfp 8080 -c httpd.conf &
pid=$!

signal_handler() {
  info "Received signal, terminating processes..."
  kill $pid
  wait $pid
  info "All processes terminated"
  exit 0
}

trap signal_handler INT TERM
wait $pid
exec "$@"
