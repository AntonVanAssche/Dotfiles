#!/bin/bash

killall spotifyd

if [ ! "$(pgrep "spotifyd")" ]; then
	"$HOME"/.local/bin/spotifyd --config-path ~/.config/spotifyd/spotifyd.conf --no-daemon &> /dev/null & spt
fi
