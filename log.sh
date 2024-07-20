info() {
  >&2 printf "%s [\033[34mINFO\033[0m] %s\n" "$(date --iso-8601=seconds)" "$1"
}

