#!/bin/bash

# Simple script to update your system.

light_cyan="\e[96m"
red="\e[31m"
reset="\e[39m"
purple="\e[95m"

echo
echo -e "[i] step 1: ${light_cyan}repairing system${reset}"
	echo -e "[i] ${red}sudo apt-get install -f${reset}"
	sudo apt-get install -f

echo
echo -e "[i] step 2: ${light_cyan}update apt cache${reset}"
	echo -e "[i] ${red}sudo apt-get update${reset}"
   	sudo  apt-get update

echo
echo -e "[i] step 3: ${light_cyan}upgrade packages${reset}"
	echo -e "[i] ${red}sudo apt-get upgrade${reset}"
	sudo apt-get upgrade

echo
echo -e "[i] step 4: ${light_cyan}clean up${reset}"
	echo -e "[i] ${red}sudo apt-get autoclean${reset}"
	sudo apt-get autoclean

echo
echo -e "[i] ${light_cyan}Done!${reset}"

echo
echo -e "[?] ${light_cyan}Do you want to reboot the system?${reset}"
        read -p "Reboot? [y/n] " reboot
        if [[ $reboot = y || $reboot = Y ]] ; then
                echo -e "[!]${red} System will reboot!${reset}"
                sleep 2
                sudo systemctl reboot
        elif [[ $reboot = n || $reboot = N ]] ; then
                echo -e "[i]${light_cyan} System won't rebooten!${reset}"
        fi
