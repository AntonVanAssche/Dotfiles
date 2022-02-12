#!/bin/bash

# Simple script to update your system.

lightCyan="\e[96m"
reset="\e[39m"

echo
echo -e "[i] ${lightCyan}repairing system${reset}"
[[ $(command -v apt-get) ]] && sudo apt-get install -f

echo
echo -e "[i] ${lightCyan}update apt cache${reset}"
[[ $(command -v apt-get) ]] && sudo  apt-get update
[[ $(command -v dnf) ]] && sudo dnf check-update

echo
echo -e "[i] ${lightCyan}upgrade packages${reset}"
[[ $(command -v apt-get) ]] && sudo apt-get upgrade
[[ $(command -v dnf) ]] && sudo dnf upgrade

echo
echo -e "[i] ${lightCyan}clean up${reset}"
[[ $(command -v apt-get) ]] && sudo apt-get autoclean
[[ $(command -v dnf) ]] && sudo dnf clean all

echo
echo -e "[?] ${lightCyan}Do you want to restart the system?${reset}"
read -pr "Reboot? [y/N] " restart
if [[ $restart = "y" || $restart = "Y" ]] ; then
   sudo systemctl reboot
fi
