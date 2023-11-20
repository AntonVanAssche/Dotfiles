#!/bin/bash

BLUETOOTH_ICON=""
STATS_ICON=""

powered=$(bluetoothctl show | grep Powered | awk '{print $2}')

if [[ "$powered" = "yes" ]]; then
    color=$COLOR_GREEN
    echo "%{F#98C379}$BLUETOOTH_ICON  "
else
    color=$COLOR_RED
    echo "%{F#E06C75}$BLUETOOTH_ICON  "
fi
