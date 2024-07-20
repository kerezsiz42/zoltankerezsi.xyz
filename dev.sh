#!/bin/sh

. ./log.sh

./generate.sh &

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
