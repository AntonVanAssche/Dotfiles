#!/usr/bin/env bash

set -o errexit  # Abort on nonzero exit code.
set -o nounset  # Abort on unbound variable.
set -o pipefail # Don't hide errors within pipes.
# set -o xtrace # Enable for debugging.

swaylock \
    -e -f -i ~/Pictures/Wallpapers/Mila-Kunis-1.jpg \
    --ring-color b3befe \
    --ring-ver-color b3befe \
    --key-hl-color -000001 \
    --inside-color b3befe \
    --inside-ver-color b3befe \
    --inside-clear-color a5e3a1 \
    --ring-clear-color a5e3a1 \
    --ring-wrong-color f37ba8 \
    --inside-wrong-color f37ba8 \
    --bs-hl-color f37ba8 \
    --text-caps-lock-color 000000
