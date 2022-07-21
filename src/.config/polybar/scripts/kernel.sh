#!/bin/bash

ICON=""
KERNEL_INFO="$(uname -r | cut -d '-' -f 1)"

printf '%s  %s' "$ICON" "$KERNEL_INFO"

