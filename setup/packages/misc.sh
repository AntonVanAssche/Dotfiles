#!/bin/bash

printf "%b" "\n${blue} • Miscellaneous applications${normal}\n"

# Install BashPass
Execute 'bash -c "$(wget -qO - https://raw.githubusercontent.com/AntonVanAssche/BashPass/master/scripts/install.sh)"' "Installing BashPass"
