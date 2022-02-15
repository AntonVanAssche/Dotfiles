#!/bin/bash

printf "%b" "\n${blue} • Gnoti${normal}\n"

gnoti() {
   git clone https://github.com/AntonVanAssche/gnoti.git --quiet
   cd gnoti/ || exit 1
   gnotiPath="$HOME""/.local/share/gnome-shell/extensions/Gnoti@AntonVA.dev"
   mkdir -p "$gnotiPath"
   cp -r ./src/* "$gnotiPath"/
   sed "30 i Main.messageTray._bannerBin.x = Right.topright(); // Top right" ./src/extension.js &> "$gnotiPath"/extension.js
   cd ../
}

Execute "gnoti" "Installing Gnoti"
