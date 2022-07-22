#!/bin/bash

BATTERY="BAT0"
ICON=""
CAP=$(cat /sys/class/power_supply/$BATTERY/capacity)

if [[ "$CAP" -lt 25 ]]; then
    ICON=" "
elif [[ "$CAP" -lt 50 ]]; then
    ICON=" "
elif [[ "$CAP" -lt 90 ]]; then
    ICON=" "
else
    ICON=" "
fi

case "$(cat /sys/class/power_supply/$BATTERY/status)" in
	"Charging")
		ICON=""
		;;
esac

if [[ "$CAP" -eq 10 ]]; then
   notify-send -u critical "Battery" "Low battery capacity ($CAP%)"
fi

printf '%s  %d%%' "$ICON" "$CAP"

