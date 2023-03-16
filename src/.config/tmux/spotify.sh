#!/usr/bin/env bash

set -o errexit  # Abort on nonzero exit code.
set -o nounset  # Abort on unbound variable.
set -o pipefail # Don't hide errors within pipes.

# Check if playerctl is installed.
# Error out if it's not, and write to stderr.
command -v playerctl >/dev/null 2>&1 || {
    printf 'Playerctl not installed' 2>&1
    exit 1
}

# Get the current status of Spotify.
# Error out if Spotify is not running, and write to stderr.
status="$(playerctl -p spotify status 2>/dev/null)" || {
    printf ' Spotify not running' 2>&1
    exit 1
}

# Print the current status of Spotify,
# with the corresponding icon and metadata.
if [[ "${status}" = 'Playing' ]]; then
    printf '♫ %s - %s' \
        "$(playerctl -p spotify metadata artist)" \
        "$(playerctl -p spotify metadata title)"
elif [[ "${status}" = 'Paused' ]]; then
    printf ' %s - %s' \
        "$(playerctl -p spotify metadata artist)" \
        "$(playerctl -p spotify metadata title)"
fi
