#!/bin/bash

printf "%b" "\n${blue} • Fonts${normal}\n"

# Download fonts.
DownloadNerdFont() {
    curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | jq '.assets[] | select(.name|match("zip$")) | .browser_download_url' | cut -d\" -f2 > 'fonts.tmp'
    while read -r; do wget "${REPLY}"; done < 'fonts.tmp'
}

Execute "DownloadNerdFont" "Downloading Nerd Fonts (This can take a while)"
Execute "wget https://assets.ubuntu.com/v1/fad7939b-ubuntu-font-family-0.83.zip" "Downloading Ubuntu fonts"

# Extract Nerd fonts.
mkdir -p "$HOME/.local/share/fonts/"

for font in ./*.zip;
do
    fontName=${font##*/}
    fontName=${fontName%%.zip}

    Execute "unzip ${font} -d $HOME/.local/share/fonts/" "Installing ${fontName}"
done

# Reload fonts cache.
Execute "fc-cache -fv" "Reloading font cache"

# Install Microsoft fonts.
Execute "sudo dnf install cabextract xorg-x11-font-utils https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm -y" "Installing Microsoft fonts"

# Clean up.
rm -rf ./*.zip fonts.tmp
