#!/bin/bash

printf "%b" "\n${blue} • Themes${normal}\n"

# Theme settings
#Execute "gsettings set org.gnome.desktop.interface gtk-theme Flat-Remix-GTK-Blue-Dark-Solid" "Applying GTK theme"
#Execute "gsettings set org.gnome.shell.extensions.user-theme name Flat-Remix-Blue-Dark" "Applying Gnome-Shell theme"
Execute "gsettings set org.gnome.desktop.interface gtk-theme adw-gtk3-dark" "Applying GTK theme"
Execute "gsettings set org.gnome.desktop.interface icon-theme Numix-Circle" "Applying icon theme"
Execute "gsettings set org.gnome.desktop.interface cursor-theme capitaine-cursors" "Applying cursor theme"
Execute "gsettings set org.gnome.desktop.wm.preferences button-layout :minimize,maximize,close" "Setting button order"
