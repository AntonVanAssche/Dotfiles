#!/bin/bash

# Simple script that shows a notification with the current playing song.
# Tip keybind this script (example: F11).

song=$(playerctl metadata --player=spotify --format "{{ xesam:title }}")
artist=$(playerctl metadata --player=spotify --format "{{ xesam:artist }}")
album=$(playerctl metadata --player=spotify --format "{{ xesam:album }}")
notify-send -i "Music Player" \ "$song" --icon=spotify -t 500 \ "$artist - $album"
