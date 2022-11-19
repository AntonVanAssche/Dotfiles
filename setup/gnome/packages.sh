#!/bin/bash

printf "%b" "\n${blue} • Gnome-shell dependencies${normal}\n"

InstallPackage "gnome-tweaks" "Installing Gnome tweaks"
InstallPackage "gnome-extensions-app" "Installing Gnome extensions app"

InstallPackage "numix-icon-theme-circle" "Installing Numix icon pack"

(
git clone -q https://github.com/lassekongo83/adw-gtk3.git
cd adw-gtk3
meson build &> /dev/null
Execute "sudo ninja -C build install" "Installing GTK theme"
)

Execute "sudo dnf copr enable tcg/themes" "Enabling capitaine-cursors copr repository"
InstallPackage "la-capitaine-cursor-theme" "Installing capitaine-cursors theme"

Execute "pip3 install pywal" "Installing pywal"
InstallPackage "rofi" "Installing Rofi"
InstallPackage "glib2-devel ImageMagick" "Installing imagemagick"
InstallPackage "nodejs-typescript" "Installing typescript"
InstallPackage "gnome-shell-extension-pop-shell" "Installing pop-shell"
InstallPackage "xprop" "Installing xprop"
InstallPackage "dconf-editor" "Installing dconf editor"

git clone -q https://github.com/AntonVanAssche/waterfall.git
mkdir -p ~/.mozilla/firefox/*.default-release/chrome/
Execute "cp -r waterfall/userChrome.css $HOME/.mozilla/firefox/*.default-release/chrome/" "Installing waterfall Firefox theme"

