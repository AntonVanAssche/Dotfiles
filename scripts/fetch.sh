#!/bin/bash

# Tiny system info script for ubuntu

# Colors

underlined="\e[4m"
bold="\e[1m"
black="\e[30m"
red="\e[31m"
green="\e[32m"
yellow="\e[33m"
blue="\e[34m"
magenta="\e[35m"
cyan="\e[36m"
white="\e[97m"
reset="\e[0m"

# Info

# User is already defined
host="$(hostname)"
os="$(lsb_release -ds)"
kernel="$(uname -sr)"
uptime="$(uptime -p | sed 's/up //')"
packages="$(dpkg -l | wc -l)"
shell="$(basename "$SHELL")"

# UI detection

if [ -n "${DE}" ]; then
	ui="${DE}"
	uitype='DE'
elif [ -n "${WM}" ]; then
	ui="${WM}"
	uitype='WM'
elif [ -n "${XDG_CURRENT_DESKTOP}" ]; then
	ui="${XDG_CURRENT_DESKTOP}"
	uitype='DE'
elif [ -n "${DESKTOP_SESSION}" ]; then
	ui="${DESKTOP_SESSION}"
	uitype='DE'
elif [ -f "${HOME}/.xinitrc" ]; then
	ui="$(tail -n 1 "${HOME}/.xinitrc" | cut -d ' ' -f 2)"
	uitype='WM'
elif [ -f "${HOME}/.xsession" ]; then
	ui="$(tail -n 1 "${HOME}/.xsession" | cut -d ' ' -f 2)"
	uitype='WM'
else
	ui='unknown'
	uitype='UI'
fi
ui="$(basename ${ui})"

# Output

echo -e "
${yellow}           _   ${underlined}${bold}${red}${USER}@${red}${host}${reset}
${yellow}       ---(_)  ${bold}${cyan}OS:        ${red}${os}${reset}
${yellow}   _/  ---  \\  ${bold}${cyan}KERNEL:    ${red}${kernel}${reset} 
${yellow}  (_) |   |    ${bold}${cyan}SHELL:     ${red}${shell}${reset}
${yellow}    \\  --- _/  ${bold}${cyan}${uitype}:        ${red}${ui}${reset}
${yellow}       ---(_)  ${bold}${cyan}PACKAGES:  ${red}${packages}${reset}
${yellow}               ${bold}${cyan}UPTIME:    ${red}${uptime}${reset}
"
pcs() { for i in {0..7}; do echo -en "\e[${1}$((30+$i))m \u2588\u2588 \e[0m"; done; }
printf "\n%s\n%s\n\n" "$(pcs)" "$(pcs '1;')"
