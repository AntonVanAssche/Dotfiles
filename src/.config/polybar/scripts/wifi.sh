#!/bin/bash

WIFI_ICON=""
STATS_ICON=""
WIFI_DEVICE="wlp0s20f3"

[[ "$(cat /sys/class/net/$WIFI_DEVICE/operstate)" == 'down' ]] && wifi_stats="down"

if [[ "$wifi_stats" = "down" ]]; then
   echo "%{F#E06C75}$WIFI_ICON"
else
   echo "%{F#98C379}$WIFI_ICON"
fi

