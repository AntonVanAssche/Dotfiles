#!/bin/bash

# This script will install all the packages I use on day-to-day use.

LSD="0.20.1"
NNN="4.0"
VSCODE="https://az764295.vo.msecnd.net/stable/379476f0e13988d90fab105c5c19e7abc8b1dea8/code_1.59.0-1628120042_amd64.deb"
DISCORD="0.0.15"

message info "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

message info "Installing wget & curl..."
sudo apt install wget curl -y

message info "Installing Termite & tools..."
sudo apt install -y vim htop wakeonlan wireguard openresolv mpv python3-pip
vim +PluginInstall +qall
git clone https://github.com/TuX-sudo/termite-ubuntu-install.git
cd termite-ubuntu-install
./termite-ubuntu --I
cd $HOME
rm -rf termite-ubuntu-install/

message info "Installing LSDeluxe ..."
wget https://github.com/Peltoche/lsd/releases/download/"$LSD"/lsd-musl_"$LSD"_amd64.deb
sudo apt install ./lsd*.deb -y
rm -rf lsd*.deb

message info "Installing nnn (file manager for terminal) ..."
wget https://github.com/jarun/nnn/releases/download/v"$NNN"/nnn_"$NNN"-1_ubuntu20.04.amd64.deb
sudo apt install ./nnn*.deb -y
rm -rf nnn*.deb

message info "Installing Nerdfonts (This can take a while)..."
mkdir fonts && cd fonts
curl -sL https://github.com/ryanoasis/nerd-fonts/releases/latest | egrep -o "/ryanoasis/nerd-fonts/releases/download/.+\.zip" | sed 's/^/https:\/\/github.com/' | wget -i/dev/fd/0
unzip "*.zip" -d ~/.local/share/fonts
fc-cache -fv
cd .. && rm -rf fonts

message info "Installing vscode..."
wget "$VSCODE"
sudo apt install ./code*.deb -y
rm -rf code*.deb

message info "Installing Transmission & Transgui..."
sudo apt install transmission transgui -y

message info "Installing Java..."
sudo apt install default-jre -y

message info "Installing Spotify..."
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update
sudo apt install spotify-client -y

message info "installing spicetify..."
/home/linuxbrew/.linuxbrew/bin/brew install khanhas/tap/spicetify-cli
sudo chmod a+wr /usr/share/spotify
sudo chmod a+wr /usr/share/spotify/Apps -R

message info "To apply the spicetify theme Log in to spotify using the client. After that run these commands: \nspicetify backup \nspicetify config extensions dribbblish.js \nspicetify config current_theme Dribbblish color_scheme base \nspicetify config inject_css 1 replace_colors 1 overwrite_assets 1 \nspicetify apply \nspicetify config color_scheme dribbblish \nspicetify apply "

message info "Installing Google Chrome..."
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb -y
rm -rf google-chrome-stable_current_amd64.deb

message info "Installing Discord..."
wget "https://dl.discordapp.net/apps/linux/"$DISCORD"/discord-"$DISCORD".deb"
sudo apt install ./discord-*.deb -y
rm -rf discord-*.deb

message info "Installing Virtualbox..."
sudo apt install virtualbox -y

message info "Installing Vagrant "
sudo apt install vagrant -y
