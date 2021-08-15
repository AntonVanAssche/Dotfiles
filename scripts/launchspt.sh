#!/bin/bash

killall spotifyd

if [ ! $(pgrep "spotifyd") ]; then
	./custom/spotifyd/target/release/spotifyd --config-path ~/.config/spotifyd/spotifyd.conf --no-daemon &> /dev/null & spt
fi
