#!/bin/bash

# Set wallpaper.
wallpaperDir="$HOME"/Pictures/Wallpapers/
Execute "cp -r ./src/walls/ $wallpaperDir" "Copying wallpapers src/walls/ → $wallpaperDir"

printf "%b" "\n${blue} • Wallpaper${normal}\n"
printf "%b" "   [${yellow}1${normal}] Barbara Palvin \n   [${yellow}2${normal}] Big-Sur \n   [${yellow}3${normal}] Cabin in the woods \n   [${yellow}4${normal}] Chad \n   [${yellow}5${normal}] Keyboards \n   [${yellow}6${normal}] Selena Gomez \n"
printf "%b" "   Select a wallpaper [${yellow}1${normal}/${yellow}2${normal}/${yellow}3${normal}/${yellow}4${normal}/${yellow}5${normal}/${yellow}6${normal}]: "
read -r wallpaper

case ${wallpaper} in
   1) Execute "gsettings set org.gnome.desktop.background picture-uri ${wallpaperDir}/Barbara-Palvin.jpg" "Setting wallpaper 'Barbara Palvin'";;
   2) Execute "gsettings set org.gnome.desktop.background picture-uri ${wallpaperDir}/Big-Sur.jpg" "Setting wallpaper 'Big-Sur'";;
   3) Execute "wal -i ${wallpaperDir}/Cabin-in-the-woods.jpeg && gsettings set org.gnome.desktop.background picture-uri ${wallpaperDir}/Cabin-in-the-woods.jpeg" "Setting wallpaper 'Cabin in the woods'";;
   4) Execute "gsettings set org.gnome.desktop.background picture-uri ${wallpaperDir}/Chad.jpg" "Setting wallpaper 'Chad'";;
   5) Execute "gsettings set org.gnome.desktop.background picture-uri ${wallpaperDir}/Keyboards.jpg" "Setting wallpaper 'Keyboards'";;
   6) Execute "gsettings set org.gnome.desktop.background picture-uri ${wallpaperDir}/Selena-Gomez.jpg" "Setting wallpaper 'Selena Gomez'";;
esac
