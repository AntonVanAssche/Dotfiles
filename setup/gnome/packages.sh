#!/bin/bash

printf "%b" "\n${blue} • Gnome-shell dependencies${normal}\n"

InstallPackage "gnome-tweaks" "Installing Gnome tweaks"
InstallPackage "gnome-extensions-app" "Installing Gnome extensions app"

#Execute "sudo dnf copr enable daniruiz/flat-remix -y" "Adding Flat-Remix repo"
#InstallPackage "gnome-shell-theme-flat-remix" "Installing Flat-Remix GTK theme"
#InstallPackage "flat-remix-gnome" "Installing Flat-Remix Gnome-Shell theme"

InstallPackage "numix-icon-theme-circle" "Installing Numix icon pack"

git clone -q https://github.com/lassekongo83/adw-gtk3.git
cd adw-gtk3
meson build &> /dev/null
Execute "sudo ninja -C build install" "Installing GTK theme"
cd ..

Execute "mkdir -p $HOME/.icons/ && cp -r ./src/cursor/capitaine-cursors/ $HOME/.icons/" "Installing cursor theme"

Execute "pip3 install pywal" "Installing pywal"
# InstallPackage "ulauncher" "Installing Ulauncher" # If you want to use Ulauncher instead of Rofi (Uncomment this line and comment the next one).
InstallPackage "rofi" "Installing Rofi"
InstallPackage "glib2-devel ImageMagick" "Installing imagemagick"
InstallPackage "nodejs-typescript" "Installing typescript"
InstallPackage "gnome-shell-extension-pop-shell" "Installing pop-shell"
InstallPackage "xprop" "Installing xprop"
InstallPackage "dconf-editor" "Installing dconf editor"

git clone -q https://github.com/rafaelmardojai/firefox-gnome-theme
cd firefox-gnome-theme
Execute "source ./scripts/auto-install.sh" "Installing Firefox Gnome theme"
cd ..
