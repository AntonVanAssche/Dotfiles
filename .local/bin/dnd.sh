#!/usr/bin/env bash

set -o errexit  # Abort on nonzero exit code.
set -o nounset  # Abort on unbound variable.
set -o pipefail # Don't hide errors within pipes.
# set -o xtrace # Enable for debugging.

current="$(dunstctl is-paused)"

if [[ "${current}" == "false" ]]; then
    notify-send "Do not disturb:  "
    sleep 1
    dunstctl set-paused true
else
    notify-send "Do not disturb:  "
    dunstctl set-paused false
fi
