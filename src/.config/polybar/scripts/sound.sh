#!/bin/bash

VOLUME="$(pactl get-sink-volume @DEFAULT_SINK@ | grep "%" | cut -d "/" -f 2 | sed 's/ //g' | sed 's/%//g')"
IS_MUTED="$(pactl get-sink-mute @DEFAULT_SINK@ | sed 's/Mute: //g')"
ICON=""

if [[ $VOLUME -lt 50 ]]; then
   ICON=""
   VOLUME="$VOLUME%"
elif [[ $VOLUME -lt 75 ]]; then
   ICON=""
   VOLUME="$VOLUME%"
elif [[ $VOLUME -gt 75 ]]; then
   ICON=""
   VOLUME="$VOLUME%"
fi

if [[ $IS_MUTED == "yes" ]]; then
   ICON=""
   VOLUME="Muted"
fi

printf '%s %s' "$ICON" "$VOLUME"

