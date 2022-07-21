#!/bin/bash

ICON=""
MEM_USAGE="$(free -m | awk '/^Mem/ { printf "%.1f/%.1fG", $3/1000, $2/1000 }' | sed s/i//g)"

printf '%s  %s' "${ICON}" "${MEM_USAGE}"
