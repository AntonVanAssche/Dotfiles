#!/bin/bash

# Tiny system info script for Ubuntu, Raspbian, Fedora and Arch Linux.

# Colors
if [ -x "$(command -v tput)" ]; then
	bold="$(tput bold)"
	black="$(tput setaf 0)"
	red="$(tput setaf 1)"
	green="$(tput setaf 2)"
	yellow="$(tput setaf 3)"
	blue="$(tput setaf 4)"
	magenta="$(tput setaf 5)"
	cyan="$(tput setaf 6)"
	white="$(tput setaf 7)"
	reset="$(tput sgr0)"
fi

# you can change these
lc="${reset}${bold}${yellow}"       # labels
nc="${reset}${bold}"                # user and hostname
ic="${reset}${bold}"                # info
c0="${reset}${black}"               # first color
c1="${reset}${white}"               # second color
c2="${reset}${yellow}"              # third color

# Info

# User is already defined
host="$(hostnamectl --static)"
os="$(. /etc/os-release && echo "$PRETTY_NAME")"
kernel="$(uname -sr)"
shell="$(basename "$SHELL")"

# UI detection

parse_rcs() {
	for f in "${@}"; do
		wm="$(tail -n 1 "${f}" 2> /dev/null | cut -d ' ' -f 2)"
		[ -n "${wm}" ] && echo "${wm}" && return
	done
}

rcwm="$(parse_rcs "${HOME}/.xinitrc" "${HOME}/.xsession")"

ui='unknown'
uitype='UI'
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
elif [ -n "${rcwm}" ]; then
	ui="${rcwm}"
	uitype='WM'
elif [ -n "${XDG_SESSION_TYPE}" ]; then
	ui="${XDG_SESSION_TYPE}"
fi

ui="$(basename ${ui})"

case $os in
    *"Ubuntu"*)
		packages="$(dpkg -l 2> /dev/null | wc -l)"
		;;
	*"Raspbian"*)
		packages="$(dpkg -l 2> /dev/null | wc -l)"
		;;
	"Fedora"*)
		packages="$(dnf list installed 2> /dev/null | sed '1d' | wc -l)"
		;;

	"Arch"*)
		packages="$(pacman -Q 2> /dev/null | wc -l)"
		;;
	*)
		packages='unknown'
esac

# Output

cat << EOF
              ${nc}${USER}${ic}@${nc}${host}${reset}
     ${c1}.${c2}~${c1}.      ${lc}OS:        ${ic}${os}${reset}
     ${c1}/${c2}V${c1}\      ${lc}KERNEL:    ${ic}${kernel}${reset}
    ${c1}/${c1}/ \\${c1}\     ${lc}PACKAGES:  ${ic}${packages}${reset} 
   ${c1}/${c1}(   )${c1}\    ${lc}SHELL:     ${ic}${shell}${reset}
    ${c1}^${c1}\`${c2}~${c1}'${c1}^     ${lc}${uitype}:        ${ic}${ui}${reset}
EOF

pcs() { for i in {0..7}; do echo -en "\e[${1}$((30+$i))m \u2588\u2588 \e[0m"; done; }
printf "\n%s\n%s\n\n" "$(pcs)" "$(pcs '1;')"
