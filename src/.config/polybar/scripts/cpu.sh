#!/bin/bash

ICON=""
CPU_USAGE="$(grep 'cpu ' /proc/stat | awk -v OFMT="%5.2f" '{usage=(($2+$4)*100/($2+$4+$5))} END {print usage}')"

printf '%s  %s%%' "$ICON" "$CPU_USAGE"

