#!/bin/bash

printf "%b" "\n${blue} • Chat applications${normal}\n"

# Add repo
Execute "sudo dnf copr enable luminoso/Signal-Desktop -y" "Adding signal-desktop repo"

# Install Signal
InstallPackage "signal-desktop" "Installing Signal"

InstallPackage "discord" "Installing discord"
