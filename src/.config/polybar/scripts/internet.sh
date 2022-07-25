#!/bin/bash

COUNT=0
DISCONECTED_ICON="睊"
WIRELESS_CONNECTED_ICON="直"
ETHERNET_CONNECTED_ICON="泌"

ID="$(ip link | awk '/state UP/ {print $2}')"

if (ping -c 1 ping -c 1 duckduckgo.com || ping -c 1 github.com || ping -c 1 google.com || ping -c 1 1.1.1) &>/dev/null; then
   if [[ $ID == e* ]]; then
       echo "%{F#98C379}$ETHERNET_CONNECTED_ICON"
   else
       echo "%{F#98C379}$WIRELESS_CONNECTED_ICON"
    fi
else
    echo "%{F#E06C75}$DISCONNECTED_ICON"
fi

