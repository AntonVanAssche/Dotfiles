#!/bin/bash

printf "%b" "\n${blue} • Music players${normal}\n"

InstallPackage "playerctl" "Installing playerctl"
InstallPackage "ffmpeg" "Installing ffmpeg"

# Add repos
Execute "sudo dnf config-manager --add-repo https://negativo17.org/repos/fedora-spotify.repo" "Adding Spotify repo"

# Install packages
InstallPackage "spotify-client" "Installing Spotify"

# Install spicetify
Execute "curl -fsSL https://raw.githubusercontent.com/khanhas/spicetify-cli/master/install.sh | sh" "Installing spicetify"
sudo chmod a+wr /lib64/spotify-client/
sudo chmod a+wr /lib64/spotify-client/Apps -R

# Install Lollypop
InstallPackage "lollypop" "Installing Lollypop"
