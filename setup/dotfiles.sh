#!/bin/bash

# Copying dotfiles
message info "Copying dotfiles..."
cp -r $DOTFILES/.vim $HOME
cp -r $DOTFILES/.vimrc $HOME
cp -r $DOTFILES/.bash* $HOME
cp -r $DOTFILES/scripts/ $HOME
cp -r $DOTFILES/.gitconfig $HOME
cp -r $DOTFILES/.config/ $HOME

# Copying doas configuration
message info "Copying doas configuration..."
[[ -f /etc/doas.conf ]] && sudo cp -r /etc/doas.conf /etc/doas.conf.backup
[[ $UBUNTU == "1" ]] && sudo cp $DOTFILES/doas/doas-ubutnu.conf /etc/doas.conf
[[ $FEDORA == "1" ]] && sudo cp $DOTFILES/doas/doas-fedora.conf /etc/doas.conf
[[ $ARCH == "1" ]] && sudo cp $DOTFILES/doas/doas-arch.conf /etc/doas.conf

# Installing Vundle.
message info "Installing vundle..."
rm -rf $HOME/.vim/bundle/Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Setting Permissions.
message info "Setting Permissions..."
chmod +x .bashrc.d/*
chmod +x scripts/*.sh
