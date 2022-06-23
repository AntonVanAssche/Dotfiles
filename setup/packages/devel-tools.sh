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
rm -rf "$HOME"/.vim/bundle/Vundle.vim
Execute "git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim --quiet" "Installing vundle"
command -v vim &> /dev/null && vim +PluginInstall +qall
cd "${HOME}/.vim/bundle/bracey.vim" || exit 1
command -v npm && Execute "npm install --prefix server" "Installing live server plugin"
cd "${dotfilesDirectory}/" || exit 1

# Copy config to '/etc/doas.conf'.
doasConfigLocation="/etc/doas.conf"
sudo cp -r "${dotfilesDirectory}/src/doas/doas.conf" "${doasConfigLocation}"
