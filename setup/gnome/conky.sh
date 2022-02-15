#!/bin/bash

printf "%b" "\n${blue} • Conky${normal}\n"

InstallPackage "conky" "Installing conky"
Execute "git clone https://github.com/AntonVanAssche/now-clocking" "Cloning now-clocking conky widget repo"
Execute "./now-clocking/scripts/download-fonts.sh" "Installing fonts"
Execute "mkdir -p $HOME/.config/conky/ && mv now-clocking $HOME/.config/conky/" "Installing now-clocking conky widget"

StartConky() {
    conky -q -c "$HOME/.config/conky/now-clocking/conky/np.lua" -d &> /dev/null
    conky -q -c "$HOME/.config/conky/now-clocking/conky/npart.lua" -d &> /dev/null
}

Execute "StartConky" "Starting conky"
