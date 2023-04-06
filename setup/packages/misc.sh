#!/bin/bash

printf "%b" "\n${blue} • Miscellaneous applications${normal}\n"

# Install BashPass
(
git clone https://github.com/AntonVanAssche/BashPass.git
cd BashPass
Execute "make install" "Installing BashPass"
)
