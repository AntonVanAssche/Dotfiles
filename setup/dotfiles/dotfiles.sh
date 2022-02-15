#!/bin/bash

printf "%b" "\n${blue} • Copying dotfiles${normal}\n"

Execute "cp -r ./src/.bashrc.d/ $HOME" "Copying src/.bashrc.d/ → $HOME/.bashrc.d/"
Execute "cp -r ./src/.bash_profile $HOME" "Copying src/.bash_profile → $HOME/.bash_profile"
Execute "cp -r ./src/.bashrc $HOME" "Copying src/.bashrc → $HOME/..bashrc"
Execute "cp -r ./src/scripts/ $HOME" "Copying src/scripts/ → $HOME/scripts/"

Execute "cp -r ./src/.gitconfig $HOME" "Copying src/.gitconfig → $HOME/.gitconfig"

Execute "cp -r ./src/.vim/ $HOME" "Copying src/.vim/ → $HOME/.vim/"
Execute "cp -r ./src/.vimrc $HOME" "Copying src/.vimrc → $HOME/.vimrc"

Execute "cp -r ./src/.config/ $HOME" "Copying src/.config/ → $HOME/.config/"
Execute "cp -r ./src/.local/ $HOME/" "Copying src/.local/ → $HOME/.local/"


chmod +x "$HOME"/.bashrc.d/*
chmod +x "$HOME"/scripts/*
