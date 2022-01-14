#!/bin/bash

function FedoraGnome() {
   message info "Installing gnome-tweaks..."; sudo dnf install gnome-tweaks -y
   message info "Installing Flat-remix theme..."; sudo dnf copr enable daniruiz/flat-remix -y && sudo dnf install gnome-shell-theme-flat-remix flat-remix-gnome -y
   message info "Installing numix-icon-theme-circle..."; sudo dnf install numix-icon-theme-circle -y
   message info "Installing cursor theme..."; mkdir .icons/ && cp -r $dotfilesDir/cursor/* .icons/
   message info "Installing pywal..."; sudo pip3 install pywal
   message info "Installing ulauncher"; sudo dnf install ulauncher -y
   message info "Installing imagemagick..."; sudo dnf install glib2-devel ImageMagick -y
   message info "Installing pop-shell..."; sudo dnf install gnome-extensions-app nodejs-typescript dnf install gnome-shell-extension-pop-shell xprop -y
}

function UbuntuGnome() {
   message info "Installing gnome-tweaks..."; sudo apt install gnome-tweaks gnome-shell-extensions -y
   message info "Installing Flat-remix theme..."; sudo add-apt-repository ppa:daniruiz/flat-remix -y && sudo apt update && sudo apt install flat-remix-gnome flat-remix-gtk -y
   message info "Installing numix-icon-theme-circle..."; sudo add-apt-repository ppa:numix/ppa -y && sudo apt update && sudo apt install numix-icon-theme-circle -y
   message info "Installing cursor theme..."; mkdir .icons/ && cp -r $dotfilesDir/cursor/* .icons/
   message info "Installing pywal..."; sudo pip3 install pywal
   message info "Installing ulauncher"; sudo add-apt-repository ppa:agornostal/ulauncher -y && sudo apt update && sudo apt install ulauncher -y
   message info "Installing imagemagick..."; sudo apt install libglib2.0-dev-bin imagemagick -y
   message info "Installing pop-shell..."; sudo apt-get install node-typescript -y
}

# installing NECESSARY packages.
[[ $OS == "Fedora Linux" ]] && FedoraGnome
[[ $OS == "Ubuntu" ]] && UbuntuGnome
[[ $OS == "Gomez OS" ]] && UbuntuGnome

# Applying theme + icon pack.
message info "Applying theme + icon pack..."
gsettings set org.gnome.desktop.interface gtk-theme "Flat-Remix-GTK-Blue-Dark-Solid"
gsettings set org.gnome.shell.extensions.user-theme name "Flat-Remix-Blue-Dark"
gsettings set org.gnome.desktop.interface icon-theme "Numix-Circle"
gsettings set  org.gnome.desktop.interface cursor-theme 'capitaine-cursors'

# Setting wallpapers.
wallpaperDir=$HOME/Pictures/Wallpapers/
mkdir $wallpaperDir
cp -r dotfiles/wallpapers/* $wallpaperDir
message info "select a wallpaper "
message quest "(1) Barbara Palvin \n             (2) Big-Sur \n             (3) Cabin in the woods \n             (4) Chad \n             (5) Keyboards \n             (6) Selena Gomez \n[1/2/3/4/5/6] "
read -p " " wallpaper
case ${wallpaper} in
   1) gsettings set org.gnome.desktop.background picture-uri $wallpaperDir/Barbara-Palvin.jpg;;
   2) gsettings set org.gnome.desktop.background picture-uri $wallpaperDir/Big-Sur.jpg;;
   3) wal -i $wallpaperDir/Cabin-in-the-woods.jpeg && gsettings set org.gnome.desktop.background picture-uri $wallpaperDir/Cabin-in-the-woods.jpeg;;
   4) gsettings set org.gnome.desktop.background picture-uri $wallpaperDir/Chad.jpg;;
   5) gsettings set org.gnome.desktop.background picture-uri $wallpaperDir/Keyboards.jpg;;
   6) gsettings set org.gnome.desktop.background picture-uri $wallpaperDir/Selena-Gomez.jpg;;
   *) message error "$wallpaper is not a valid option!";;
esac

# Installling conky + Now Clocking widget.
message info "Installing conky..."
sudo dnf install conky ffmpeg playerctl -y
git clone https://github.com/rayzr522/now-clocking.git
source ./now-clocking/scripts/download-fonts.sh
mkdir -p $HOME/.config/conky/ && mv $HOME/now-clocking $HOME/.config/conky/
conky -q -c $HOME/.config/conky/now-clocking/conky/np.lua -d &> /dev/null
conky -q -c $HOME/.config/conky/now-clocking/conky/npart.lua -d &> /dev/null

message info "Installing Gnoti..."
git clone https://github.com/TuX-sudo/gnoti.git
cd gnoti/
gnotiPath=$HOME"/.local/share/gnome-shell/extensions/Gnoti@AntonVA.dev"
mkdir -p ${gnotiPath}
cp -r ./src/* ${gnotiPath}/
sed "30 i Main.messageTray._bannerBin.x = Right.topright(); // Top right" ./src/extension.js &> ${gnotiPath}/extension.js
message info "Files copied to ${gnotiPath}"
cd $HOME

if [[ $OS == "Ubuntu" ]] || [[ $OS == "Gomez OS" ]]; then
   git clone https://github.com/pop-os/shell
   cd shell
   make && make local-install
   cd $Home
fi
