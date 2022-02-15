#!/bin/bash

printf "%b" "\n${blue} • Music players${normal}\n"

InstallPackage "playerctl" "Installing playerctl"
InstallPackage "ffmpeg" "Installing ffmpeg"

# Add repos
Execute "sudo dnf config-manager --add-repo https://negativo17.org/repos/fedora-spotify.repo" "Adding Spotify repo"
Execute "sudo dnf copr enable atim/spotify-tui -y" "Adding Spotify-tui repo"

# Install packages
InstallPackage "spotify-client" "Installing Spotify"
InstallPackage "spotify-tui" "Installing Spotify-tui"

# Install spotifyd
spotifydLatestVersion="$(curl --silent "https://api.github.com/repos/Spotifyd/spotifyd/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")')"
Execute "wget https://github.com/Spotifyd/spotifyd/releases/download/${spotifydLatestVersion}/spotifyd-linux-default.tar.gz" "Download spotifyd"
mkdir -p "$HOME"/.local/bin/
Execute "tar -xf spotifyd-linux-default.tar.gz && cp -r ./spotifyd $HOME/.local/bin/spotifyd" "Installing spotifyd"
rm -rf spotifyd-linux-default.tar.gz

# Install spicetify
Execute "curl -fsSL https://raw.githubusercontent.com/khanhas/spicetify-cli/master/install.sh | sh" "Installing spicetify"
sudo chmod a+wr /lib64/spotify-client/
sudo chmod a+wr /lib64/spotify-client/Apps -R

# Install Lollypop
InstallPackage "lollypop" "Installing Lollypop"
