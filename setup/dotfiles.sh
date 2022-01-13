#!/bin/bash

# Copying dotfiles
message info "Copying dotfiles..."
cp -r $dotfilesDir/.vim $HOME
cp -r $dotfilesDir/.vimrc $HOME
cp -r $dotfilesDir/.bash* $HOME
cp -r $dotfilesDir/scripts/ $HOME
cp -r $dotfilesDir/.gitconfig $HOME
cp -r $dotfilesDir/.config/ $HOME

# Copying doas configuration
message info "Copying doas configuration..."
[[ -f /etc/doas.conf ]] && sudo cp -r /etc/doas.conf /etc/doas.conf.backup
[[ $ubuntu == "1" ]] && sudo cp $dotfilesDir/doas/doas-ubutnu.conf /etc/doas.conf
[[ $fedora == "1" ]] && sudo cp $dotfilesDir/doas/doas-fedora.conf /etc/doas.conf

# Installing Vundle.
message info "Installing vundle..."
rm -rf $HOME/.vim/bundle/Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Setting Permissions.
message info "Setting Permissions..."
chmod +x .bashrc.d/*
chmod +x scripts/*.sh
