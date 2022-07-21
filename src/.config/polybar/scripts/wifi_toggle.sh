#!/bin/bash

WIFI_DEVICE="wlp0s20f3"

[[ "$(cat /sys/class/net/$WIFI_DEVICE/operstate)" == 'down' ]] && wifi_stats="down"

if [[ "$wifi_stats" = "down" ]]; then
   nmcli radio wifi on
else
   nmcli radio wifi off
fi

