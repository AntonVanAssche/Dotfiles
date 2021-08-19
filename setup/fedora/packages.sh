#!/bin/bash

# This script will install all the packages I use on day-to-day use.

LSD="0.20.1"
NNN="4.0"
VSCODE="https://az764295.vo.msecnd.net/stable/379476f0e13988d90fab105c5c19e7abc8b1dea8/code_1.59.0-1628120042_amd64.deb"
DISCORD="0.0.15"

message info "Enabling RPM fusion repo's..."
sudo dnf install \
https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

message info "Installing wget & curl..."
sudo dnf install wget curl -y

message info "Installing Termite & tools..."
sudo dnf install -y termite vim lsd nnn htop wol wireguard-tools openresolv mpv mpv-libs python3-pip
vim +PluginInstall +qall

message info "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

message info "Installing Nerdfonts (This can take a while)..."
mkdir fonts && cd fonts
curl -sL https://github.com/ryanoasis/nerd-fonts/releases/latest | egrep -o "/ryanoasis/nerd-fonts/releases/download/.+\.zip" | sed 's/^/https:\/\/github.com/' | wget -i/dev/fd/0
unzip "*.zip" -d ~/.local/share/fonts
fc-cache -fv
cd .. && rm -rf fonts

message info "Installing vscode..."
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
sudo dnf install code

message info "Installing Transmission & Transgui..."
sudo dnf install transmission transmission-remote-gtk -y

message info "Installing Java..."
sudo dnf install java-latest-openjdk.x86_64

message info "Installing Spotify..."
sudo dnf install lpf-spotify-client -y

message info "installing spicetify..."
/home/linuxbrew/.linuxbrew/bin/brew install khanhas/tap/spicetify-cli
sudo chmod a+wr /usr/share/spotify
sudo chmod a+wr /usr/share/spotify/Apps -R

message info "To apply the spicetify theme Log in to spotify using the client. After that run these commands: \nspicetify backup \nspicetify config extensions dribbblish.js \nspicetify config current_theme Dribbblish color_scheme base \nspicetify config inject_css 1 replace_colors 1 overwrite_assets 1 \nspicetify apply \nspicetify config color_scheme dribbblish \nspicetify apply "

message info "Installing Google Chrome..."
sudo dnf install google-chrome-stable -y

message info "Installing Discord..."
sudo dnf install discord -y

message info "Installing Microsoft fonts..."
sudo dnf install cabextract xorg-x11-font-utils -Y
sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm

message info "Installing Onlyoffice-desktop editor..."
sudo dnf install https://download.onlyoffice.com/repo/centos/main/noarch/onlyoffice-repo.noarch.rpm -y
sudo dnf install onlyoffice-desktopeditors -y

message info "Installing Virtualbox..."
sudo dnf install virtualbox -y

message info "Installing Vagrant "
sudo dnf install vagrant -y