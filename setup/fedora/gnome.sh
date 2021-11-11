#!/bin/bash

# This script will setup gnome.

# installing NECESSARY packages.
message info "Installing gnome-tweaks..."; sudo dnf install gnome-tweaks -y
message info "Installing Flat-remix theme..."; sudo dnf copr enable daniruiz/flat-remix -y && sudo dnf install gnome-shell-theme-flat-remix flat-remix-gnome -y
message info "Installing numix-icon-theme-circle..."; sudo dnf install numix-icon-theme-circle -y
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
message quest "(1) Big-Sur \n             (2) Keyboards \n             (3) Cabin in the woods \n             (4) Selena Gomez swimming pool \n             (5) Barbara Palvin \n             (6) Chad \n[1/2/3/4/5/6] "
read -p " " WALLPAPER
   case ${WALLPAPER} in
     1) gsettings set org.gnome.desktop.background picture-uri $WALLPAPERS/Big-Sur.jpg;;
     2) gsettings set org.gnome.desktop.background picture-uri $WALLPAPERS/Keyboards.jpg;;
     3) wal -i $WALLPAPERS/Cabin-in-the-woods.jpeg && gsettings set org.gnome.desktop.background picture-uri $WALLPAPERS/Cabin-in-the-woods.jpeg;;
     4) gsettings set org.gnome.desktop.background picture-uri $WALLPAPERS/Selena-Gomez-swimming-pool.jpg;;
     5) gsettings set org.gnome.desktop.background picture-uri $WALLPAPERS/barbara-palvin.jpg;;
     6) gsettings set org.gnome.desktop.background picture-uri $WALLPAPERS/barbara-palvin.jpg;;
     *) message error "$WALLPAPER is not a valid option!";;
	esac

# Installling conky + Now Clocking widget.
message info "Installing conky..."
  sudo dnf install conky ffmpeg playerctl -y
  git clone https://github.com/TuX-sudo/now-clocking.git
  source ./now-clocking/scripts/download-fonts.sh
  mkdir $HOME/.custom && mv $HOME/now-clocking $HOME/.custom/
  conky -q -c $HOME/.custom/now-clocking/conky/np.lua -d &> /dev/null
  conky -q -c $HOME/.custom/now-clocking/conky/npart.lua -d &> /dev/null

message info "Installing Gnoti..."
   git clone https://gitlab.com/sudo_TuX/gnoti.git
   cd gnoti/

   GNOTI_PATH=$HOME"/.local/share/gnome-shell/extensions/Gnoti@AntonVA.dev"
   mkdir -p ${GNOTI_PATH}
   cp -r ./src/* ${GNOTI_PATH}/
   touch ${GNOTI_PATH}/config.json
   sed "30 i Main.messageTray._bannerBin.x = Right.topright(); // Top right" ./src/extension.js &> ${GNOTI_PATH}/extension.js
   message info "Files copied to ${GNOTI_PATH}"

   if [[ $XDG_SESSION_TYPE == "x11" ]]; then
      message info "Restarting Gnome Shell"
      busctl --user call org.gnome.Shell /org/gnome/Shell org.gnome.Shell Eval s 'Meta.restart("Restarting…")' &> /dev/null
      message info "Gnoti has been succesfully installed!"
   else
      message info "Gnoti has been succesfully installed!"
      message warn "Please log out and then log back in for the changes to take effect."
   fi

   cd $HOME

# Installing pop-shell
message info "Installing imagemagick..."; sudo dnf install glib2-devel ImageMagick -y
message info "Installing pop-shell..."; sudo dnf install gnome-extensions-app nodejs-typescript -y
   git clone https://github.com/pop-os/shell
   cd shell
   make && make local-install
   cd $Home

message info "Now install these gnome-extensions using https://extensions.gnome.org/ \\nBlur my Shell \\nClipboard Indicator \\nGnome 40 UI improvements \\nHide Activities Button \\nMpris Indicator Button \\nNo overview at start-up \\nSound Input & Output Device Chooser \\nX11 Gestures \\nHot Edge"
