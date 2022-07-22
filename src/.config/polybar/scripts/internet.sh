#!/bin/bash

WIFI_ICON=""
ETHERNET_ICON="🌐"
STATS_ICON=""

[[ "$(cat /sys/class/net/w*/operstate)" == 'down' ]] && wifi_stats="down"
[[ "$(cat /sys/class/net/e*/operstate)" == 'down' ]] && ethernet_stats="down"

if [[ "$wifi_stats" == "down" ]]; then
   echo -n "%{F#E06C75}$WIFI_ICON   "
else
   echo -n "%{F#98C379}$WIFI_ICON   "
fi

if [[ "$ethernet_stats" == "down" ]]; then
   echo -n "%{F#E06C75}$ETHERNET_ICON"
else
   echo -n "%{F#98C379}$ETHERNET_ICON"
fi

