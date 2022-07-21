#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

(sleep 2; polybar primary) &

if [[ $(xrandr -q | grep "HDMI-1-0 connected") ]]; then
   (sleep 2; polybar secondary) &
fi

