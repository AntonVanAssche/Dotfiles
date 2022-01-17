#!/bin/bash

# Simple script to set a new wallpaper after 2 minutes.
backgrounds=("$HOME/Pictures/Wallpapers/*" "$HOME/.local/share/backgrounds/*" "/usr/share/backgrounds/*")
backgroundList="$HOME/Pictures/Wallpapers/wallpapersList.txt"

rm -rf $backgroundList

for background in ${backgrounds[@]};
do
	[[ ! -d $background ]] && ls -1d $background >> $backgroundList
done

while true
 do
	 currentBackground=$(shuf -n 1 $backgroundList)
	 gsettings set org.gnome.desktop.background picture-uri $currentBackground
	 sleep 120
 done
