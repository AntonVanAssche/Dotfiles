#!/bin/bash

printf "%b" "\n${blue} • Torrenting tools${normal}\n"

InstallPackage "transmission" "Installing transmission"
InstallPackage "transmission-remote-gtk" "Installing transgui"
