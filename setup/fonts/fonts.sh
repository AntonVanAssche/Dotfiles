#!/bin/bash

printf "%b" "\n${blue} • Fonts${normal}\n"

# Download fonts.
Execute "curl -sL https://github.com/ryanoasis/nerd-fonts/releases/latest | grep -E -o "/ryanoasis/nerd-fonts/releases/download/.+\.zip" | sed 's/^/https:\/\/github.com/' | wget -i/dev/fd/0" "Downloading Nerd Fonts (This can take a while)"
Execute "wget https://assets.ubuntu.com/v1/fad7939b-ubuntu-font-family-0.83.zip" "Downloading Ubuntu fonts"

# Extract Nerd fonts.
mkdir -p "$HOME/.local/share/fonts/"

for font in ./*.zip;
do
   Execute "unzip ${font} -d $HOME/.local/share/fonts/" "Installing ${font}"
done

# Reload fonts cache.
Execute "fc-cache -fv" "Reloading font cache"

# Install Microsoft fonts.
Execute "sudo dnf install cabextract xorg-x11-font-utils https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm -y" "Installing Microsoft fonts"

# Clean up.
rm -rf ./*.zip
