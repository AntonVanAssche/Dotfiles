#!/bin/bash

# This script will setup gnome.

# installing NECESSARY packages.
message info "Installing gnome-tweaks..."; sudo apt install gnome-tweaks gnome-shell-extensions -y
message info "Installing Flat-remix theme..."; sudo add-apt-repository ppa:daniruiz/flat-remix -y && sudo apt update && sudo apt install flat-remix-gnome flat-remix-gtk -y
message info "Installing gnome-shell-extensions" sudo apt install gnome-shell-extensions
message info "Installing numix-icon-theme-circle..."; sudo add-apt-repository ppa:numix/ppa -y && sudo apt update && sudo apt install numix-icon-theme-circle -y
message info "Installing cursor theme..."; mkdir .icons/ && cp -r $DOTFILES/cursor/* .icons/
message info "Installing pywal..."; sudo pip3 install pywal

# Applying theme + icon pack.
message info "Applying theme + icon pack..."
gsettings set org.gnome.desktop.interface gtk-theme "Flat-Remix-GTK-Blue-Dark-Solid"
gsettings set org.gnome.shell.extensions.user-theme name "Flat-Remix-Blue-Dark"
gsettings set org.gnome.desktop.interface icon-theme "Numix-Circle"
gsettings set  org.gnome.desktop.interface cursor-theme 'capitaine-cursors'

# Setting wallpapers.
WALLPAPERS=$HOME/Pictures/wallpapers/
mkdir $WALLPAPERS
cp -r dotfiles/wallpapers/* $WALLPAPERS
message info "select a wallpaper "
message quest "(1) Big-Sur \n(2) Keyboards \n(3) Cabin in the woods \n(4) Selena Gomez swimming pool \n (5) Tay Tay \n(6) Barbara Palvin \n"
read -p "[1/2/3/4/5/6] " WALLPAPER
echo
   case ${WALLPAPER} in
     1) gsettings set org.gnome.desktop.background picture-uri $WALLPAPERS/Big-Sur.jpg;;
     2) gsettings set org.gnome.desktop.background picture-uri $WALLPAPERS/Keyboards.jpg;;
     3) wal -i $WALLPAPERS/Cabin-in-the-woods.jpeg && gsettings set org.gnome.desktop.background picture-uri $WALLPAPERS/Cabin-in-the-woods.jpeg;;
     4) gsettings set org.gnome.desktop.background picture-uri $WALLPAPERS/Selena-Gomez-swimming-pool.jpg;;
     5) gsettings set org.gnome.desktop.background picture-uri $WALLPAPERS/Tay-Tay.jpg;;
     6) gsettings set org.gnome.desktop.background picture-uri $WALLPAPERS/barbara-palvin.jpg;;
     *) message error "$WALLPAPER is not a valid option!";;
	esac

# Installling conky + Now Clocking widget.
message info "Installing conky..."
  sudo apt install conky-all ffmpeg playerctl -y
  git clone https://github.com/Rayzr522/now-clocking.git
  source ./now-clocking/scripts/download-fonts.sh
  mkdir $HOME/.custom && mv ./now-clocking $HOME/.custom/
  conky -q -c $HOME/.custom/conky/np.lua -d &>/dev/null
  conky -q -c $HOME/.custom/conky/npart.lua -d

message info "Installing Gnoti..."
   git clone https://gitlab.com/sudo_TuX/gnoti.git
   cd gnoti/

   GNOTI_PATH=$HOME"/.local/share/gnome-shell/extensions/Gnoti@AntonVA.dev"
   mkdir -p ${GNOTI_PATH}
   cp -r ./src/* ${GNOTI_PATH}/
   touch ${GNOTI_PATH}/config.json
   sed "30 i Main.messageTray._bannerBin.x = Right.topright(); // Top right" ./src/extension.js &> ${GNOTI_PATH}/extension.js
   message info "Files copied to ${GNOTI_PATH}"

   if [[ ""$(echo $XDG_SESSION_TYPE) == "x11" ]]; then
      message info "Restarting Gnome Shell"
      busctl --user call org.gnome.Shell /org/gnome/Shell org.gnome.Shell Eval s 'Meta.restart("Restarting…")' &> /dev/null
      message info "Gnoti has been succesfully installed!"
   else
      message info "Gnoti has been succesfully installed!"
      message warn "Please log out and then log back in for the changes to take effect."
   fi

   cd $HOME

# Installing pop-shell
message info "Installing imagemagick..."; sudo apt install libglib2.0-dev-bin imagemagick -y
message info "Installing pop-shell..."; sudo apt-get install node-typescript -y
   git clone https://github.com/pop-os/shell
   cd shell
   make && make local-install
   cd $Home

message info "Now install these gnome-extensions using https://extensions.gnome.org/ \nBlur my Shell \nClipboard Indicator\nDash to Dock \nGnome 40 UI improvements (If using Gnome 40)\nHide Activities Button \nMpris Indicator Button \nNo overview at start-up (If using Gnome 40) \nSound Input & Output Device Chooser \nX11 Gestures (If using X11 and Gnome 40)"
