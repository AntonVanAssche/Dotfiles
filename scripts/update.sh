#!/bin/bash

# Simple script to update your system.

lightCyan="\e[96m"
reset="\e[39m"

echo
echo -e "[i] ${lightCyan}repairing system${reset}"
sudo apt-get install -f

echo
echo -e "[i] ${lightCyan}update apt cache${reset}"
sudo  apt-get update

echo
echo -e "[i] step 3: ${lightCyan}upgrade packages${reset}"
sudo apt-get upgrade

echo
echo -e "[i] ${lightCyan}clean up${reset}"
sudo apt-get autoclean

echo
echo -e "[?] ${lightCyan}Do you want to restart the system?${reset}"
read -p "Reboot? [y/N] " restart
if [[ $restart = "y" || $restart = "Y" ]] ; then
   sudo systemctl reboot
fi
