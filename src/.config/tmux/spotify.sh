#!/usr/bin/env bash

set -o errexit # Abort on nonzero exit code.
set -o nounset # Abort on unbound variable.
set -o pipefail # Don't hide errors within pipes.

command -v playerctl >/dev/null 2>&1 || exit 0

if playerctl status 2>/dev/null | grep -q "Playing"; then
    printf '♫ %s - %s' "$(playerctl -p spotify metadata artist)" "$(playerctl -p spotify metadata title)"
fi
