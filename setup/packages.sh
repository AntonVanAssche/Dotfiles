#!/bin/bash

# Abort if error.
set -eu

function FedoraPackages() {
   message info "Enabling RPM fusion repo's..."
   sudo dnf install \
   https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-"$(rpm -E %fedora)".noarch.rpm \
   https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-"$(rpm -E %fedora)".noarch.rpm -y

   message info "Installing Homebrew..."
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

   message info "Installing wget & curl..."
   sudo dnf install wget curl -y

   message info "Installing Termite & tools..."
   sudo dnf copr enable skidnik/termite -y
   sudo dnf install -y termite doas vim lsd nnn htop wol wireguard-tools openresolv mpv mpv-libs python3-pip
   vim +PluginInstall +qall
   /home/linuxbrew/.linuxbrew/bin/brew install gotop fff spotify-tui

   message info "Installing Signal-desktop..."
   sudo dnf copr enable luminoso/Signal-Desktop -y
   sudo dnf install signal-desktop -y

   message info "Installing vscode..."
   sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
   sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
   sudo dnf update -y
   sudo dnf install code -y

   message info "Installing Transmission & Transgui..."
   sudo dnf install transmission transmission-remote-gtk -y

   message info "Installing Java..."
   sudo dnf install java-latest-openjdk.x86_64 -y

   message info "Installing Spotify..."
   sudo dnf config-manager --add-repo https://negativo17.org/repos/fedora-spotify.repo
   sudo dnf install spotify-client -y

   message info "installing spicetify..."
   /home/linuxbrew/.linuxbrew/bin/brew install khanhas/tap/spicetify-cli
   sudo chmod a+wr /lib64/spotify-client/
   sudo chmod a+wr /lib64/spotify-client/Apps -R

   message info "To apply the spicetify theme Log in to spotify using the client. After that run these commands: \nspicetify backup \nspicetify config extensions dribbblish.js \nspicetify config current_theme Dribbblish color_scheme base \nspicetify config inject_css 1 replace_colors 1 overwrite_assets 1 \nspicetify apply \nspicetify config color_scheme dribbblish \nspicetify apply "

   message info "Installing Google Chrome..."
   sudo dnf install fedora-workstation-repositories -y
   sudo dnf config-manager --set-enabled google-chrome -y
   sudo dnf install google-chrome-stable -y

   message info "Installing Discord..."
   sudo dnf install discord -y

   message info "Installing Microsoft fonts..."
   sudo dnf install cabextract xorg-x11-font-utils -y
   sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm

   message info "Installing Onlyoffice-desktop editor..."
   sudo dnf install https://download.onlyoffice.com/repo/centos/main/noarch/onlyoffice-repo.noarch.rpm -y
   sudo dnf install onlyoffice-desktopeditors -y
}

function UbuntuPackages() {
   lsd="0.20.1"
   vscode="https://az764295.vo.msecnd.net/stable/379476f0e13988d90fab105c5c19e7abc8b1dea8/code_1.59.0-1628120042_amd64.deb"
   discord="0.0.15"

   message info "Installing Homebrew..."
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

   message info "Installing wget & curl..."
   sudo apt install wget curl -y

   message info "Installing Termite & tools..."
   sudo apt install -y doas vim htop wakeonlan wireguard openresolv mpv python3-pip
   vim +PluginInstall +qall
   git clone https://github.com/AntonVanAssche/termite-ubuntu-install.git
   cd termite-ubuntu-install
   ./termite-ubuntu --I
   cd "$HOME"
   rm -rf termite-ubuntu-install/
   /home/linuxbrew/.linuxbrew/bin/brew install gotop fff spotify-tui

   message info "Installing LSDeluxe ..."
   wget https://github.com/Peltoche/lsd/releases/download/"$lsd"/lsd-musl_"$lsd"_amd64.deb
   sudo apt install ./lsd*.deb -y
   rm -rf lsd*.deb

   message info "Installing vscode..."
   wget "$vscode"
   sudo apt install ./code*.deb -y
   rm -rf code*.deb

   message info "Installing Transmission & Transgui..."
   sudo apt install transmission transgui -y

   message info "Installing Java..."
   sudo apt install default-jre -y

   message info "Installing Spotify..."
   curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - 
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
   wget "https://dl.discordapp.net/apps/linux/$discord/discord-$discord.deb"
   sudo apt install ./discord-*.deb -y
   rm -rf discord-*.deb
}

function Fonts() {
   message info "Installing Nerdfonts (This can take a while)..."
   mkdir fonts && cd fonts
   curl -sL https://github.com/ryanoasis/nerd-fonts/releases/latest | grep -E -o "/ryanoasis/nerd-fonts/releases/download/.+\.zip" | sed 's/^/https:\/\/github.com/' | wget -i/dev/fd/0
   unzip "*.zip" -d ~/.local/share/fonts
   
   if [[ $OS == "Fedora Linux" ]]; then
      message info "Installing Ubuntu fonts..."
      wget https://assets.ubuntu.com/v1/fad7939b-ubuntu-font-family-0.83.zip
      unzip fad7939b-ubuntu-font-family-0.83.zip -d ~/.local/share/fonts
      fc-cache -fv
      cd .. && rm -rf fonts
   fi
}

[[ $OS == "Fedora Linux" ]] && FedoraPackages
[[ $OS == "Ubuntu" ]] && UbuntuPackages
[[ $OS == "Gomez OS" ]] && UbuntuPackages
Fonts
