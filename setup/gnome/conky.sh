#!/bin/bash

printf "%b" "\n${blue} • Conky${normal}\n"

InstallPackage "conky" "Installing conky"
Execute "$HOME/.config/conky/now-clocking/scripts/download-fonts.sh" "Installing fonts"

StartConky() {
    conky -q -c "$HOME/.config/conky/now-clocking/conky/np.lua" -d &> /dev/null
    conky -q -c "$HOME/.config/conky/now-clocking/conky/npart.lua" -d &> /dev/null
}

Execute "StartConky" "Starting conky"
