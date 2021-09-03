#!/bin/bash

# Simple script to set a new wallpaper after 2 minutes.
backgroundsdir="$HOME/Pictures/wallpapers/*"
piclist="$HOME/Pictures/bgpiclist.txt"

rm -rf $piclist
ls -1d $backgroundsdir > $piclist

while true
 do
	 currentpic=$(shuf -n 1 $piclist)
	 gsettings set org.gnome.desktop.background picture-uri $currentpic
	 notificationcurrentpic=$(ls $currentpic | xargs -n 1 basename)
	 sleep 120
 done
