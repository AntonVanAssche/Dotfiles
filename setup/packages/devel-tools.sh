#!/bin/bash 

printf "%b" "\n${blue} • Devel tools${normal}\n"

# Add termite repo.
Execute " sudo dnf copr enable skidnik/termite -y" "Adding termite repo"

# Install packages.
packagesToInstall=(
   doas
   termite
   cargo
   vim-enhanced
   lsd
   htop
   wol
   wireguard-tools
   openresolv
   mpv
   mpv-libs
   python3-pip
   java-latest-openjdk.x86_64
   wget
   curl
   VirtualBox
   ninja-build
   meson
   sassc
   most
   bat
   golang
   nodejs
   )

for packageToInstall in "${packagesToInstall[@]}";
do
   InstallPackage "${packageToInstall}" "Installing ${packageToInstall}"
done

# Vim plugins.
rm -rf "$HOME"/.vim/autoload/plug.vim
Execute "curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" "Installing vim-plug"
command -v vim &> /dev/null && vim +PlugInstall +qall

# Copy config to '/etc/doas.conf'.
doasConfigLocation="/etc/doas.conf"
sudo cp -r "${dotfilesDirectory}/src/doas/doas.conf" "${doasConfigLocation}"
