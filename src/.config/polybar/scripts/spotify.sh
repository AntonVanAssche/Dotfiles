#!/bin/bash

ICON=""
SPOTIF_SONG="$(playerctl metadata --player spotify --format "{{ xesam:title }}" 2> /dev/null)"
SPOTIF_ARTIST="$(playerctl metadata --player spotify --format "{{ xesam:artist }}" 2> /dev/null)"
SPOTIFY_STATUS="$SPOTIF_SONG - $SPOTIF_ARTIST"

pgrep -x spotify > /dev/null && printf '%s  %s' "$ICON" "$SPOTIFY_STATUS"

