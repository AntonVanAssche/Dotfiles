#!/bin/bash

printf "%b" "\n${blue} • Default apps${normal}\n"

# Set alacritty as the default terminal.
Execute "gsettings set org.gnome.desktop.default-applications.terminal exec alacritty" "Setting alacritty as the default terminal"

