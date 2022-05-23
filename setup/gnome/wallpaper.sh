#!/bin/bash

# Set wallpaper.
wallpaperDir="$HOME"/Pictures/Wallpapers/
Execute "cp -r ./src/walls/ $wallpaperDir" "Copying wallpapers src/walls/ → $wallpaperDir"

printf "%b" "\n${blue} • Wallpaper${normal}\n"
printf "%b" "   [${yellow}1${normal}] Barbara Palvin \n   [${yellow}2${normal}] Big-Sur \n   [${yellow}3${normal}] Cabin in the woods \n   [${yellow}4${normal}] Chad \n   [${yellow}5${normal}] Emma Watson \n   [${yellow}6${normal}] Keyboards \n   [${yellow}7${normal}] Selena Gomez \n   [${yellow}8${normal}] Tate McRae \n"
printf "%b" "   Select a wallpaper [${yellow}1${normal}-${yellow}8${normal}] or [${yellow}name${normal}]: "
read -r wallpaper

case ${wallpaper} in
   1| "Barbara Palvin") Execute "gsettings set org.gnome.desktop.background picture-uri ${wallpaperDir}/Barbara-Palvin.jpg" "Setting wallpaper 'Barbara Palvin'";;
   2| "Big-Sur") Execute "gsettings set org.gnome.desktop.background picture-uri ${wallpaperDir}/Big-Sur.jpg" "Setting wallpaper 'Big-Sur'";;
   3| "Cabin in the woods") Execute "wal -i ${wallpaperDir}/Cabin-in-the-woods.jpeg && gsettings set org.gnome.desktop.background picture-uri ${wallpaperDir}/Cabin-in-the-woods.jpeg" "Setting wallpaper 'Cabin in the woods'";;
   4| "Chad") Execute "gsettings set org.gnome.desktop.background picture-uri ${wallpaperDir}/Chad.jpg" "Setting wallpaper 'Chad'";;
   5| "Emma Watson") Execute "gsettings set org.gnome.desktop.background picture-uri ${wallpaperDir}/Emma-Watson.jpg" "Setting wallpaper 'Emma Watson'";;
   6| "Keyboards") Execute "gsettings set org.gnome.desktop.background picture-uri ${wallpaperDir}/Keyboards.jpg" "Setting wallpaper 'Keyboards'";;
   7| "Selena Gomez") Execute "gsettings set org.gnome.desktop.background picture-uri ${wallpaperDir}/Selena-Gomez.jpg" "Setting wallpaper 'Selena Gomez'";;
   8| "Tate McRae") Execute "gsettings set org.gnome.desktop.background picture-uri ${wallpaperDir}/Tate-McRae.jpg" "Setting wallpaper 'Tate McRae'";;
esac
