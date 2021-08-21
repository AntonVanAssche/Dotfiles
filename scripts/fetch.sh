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

# Info

# User is already defined
host="$(hostnamectl --static)"
os="$(hostnamectl | grep "Operating System: " | sed -e "s/Operating System: //")"
kernel="$(uname -sr)"
uptime="$(uptime -p | sed 's/up //')"
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
		os="$(hostnamectl | grep "Operating System: " | sed -e "s/Operating System: //")"

		# you can change these
		lc="${reset}${bold}${cyan}"      # labels
		nc="${reset}${bold}${red}"       # user and hostname
		ic="${reset}${bold}${red}"       # info
		c0="${reset}${red}"              # first color

## OUTPUT

cat <<EOF

${c0}           _   ${nc}${USER}@${host}${reset}
${c0}       ---(_)  ${lc}OS:        ${ic}${os}${reset}
${c0}   _/  ---  \\  ${lc}KERNEL:      ${ic}${kernel}${reset} 
${c0}  (_) |   |    ${lc}UPTIME:      ${ic}${uptime}${reset}
${c0}    \\  --- _/  ${lc}PACKAGES:    ${ic}${packages}${reset} 
${c0}       ---(_)  ${lc}SHELL:       ${ic}${shell}${reset}
${c0}               ${lc}${uitype}:          ${ic}${ui}${reset}

EOF
		;;
	
	*"Raspbian"*)
		packages="$(dpkg -l 2> /dev/null | wc -l)"

		# you can change these
		lc="${reset}${bold}${red}"          # labels
		nc="${reset}${bold}${red}"          # user and hostname
		ic="${reset}${bold}"                # info
		c0="${reset}${green}"               # first color
		c1="${reset}${red}"                 # second color

## OUTPUT

cat <<EOF

${c0}    __  __    ${nc}${USER}${ic}@${nc}${host}${reset}
${c0}   (_\\)(/_)   ${lc}OS:        ${ic}${os}${reset}
${c1}   (_(__)_)   ${lc}KERNEL:      ${ic}${kernel}${reset}
${c1}  (_(_)(_)_)  ${lc}UPTIME:      ${ic}${uptime}${reset}
${c1}   (_(__)_)   ${lc}PACKAGES:    ${ic}${packages}${reset}
${c1}     (__)     ${lc}SHELL:       ${ic}${shell}${reset}
${c1}              ${lc}${uitype}:          ${ic}${ui}${reset}

EOF
		;;
	
	"Fedora"*)
		packages="$(dnf list installed 2> /dev/null | sed '1d' | wc -l)"
		
		# you can change these
		lc="${reset}${bold}${blue}"         # labels
		nc="${reset}${bold}${blue}"         # user and hostname
		ic="${reset}${bold}"                # info
		c0="${reset}${white}"               # first color
		c1="${reset}${blue}"                # second color

		## OUTPUT

cat <<EOF
${c0}        _____
${c0}       /   __)${c1}\\   ${nc}${USER}${ic}@${nc}${host}${reset}
${c0}       |  /  ${c1}\\ \\  ${lc}OS:        ${ic}${os}${reset}
${c1}    __${c0}_|  |_${c1}_/ /  ${lc}KERNEL:    ${ic}${kernel}${reset}
${c1}   / ${c0}(_    _)${c1}_/   ${lc}UPTIME:    ${ic}${uptime}${reset}
${c1}  / /  ${c0}|  |       ${lc}PACKAGES:  ${ic}${packages}${reset}
${c1}  \\ \\${c0}__/  |       ${lc}SHELL:     ${ic}${shell}${reset}
${c1}   \\${c0}(_____/       ${lc}${uitype}:        ${ic}${ui}${reset}

EOF
		;;

	"Arch"*)
		packages="$(pacman -Q 2> /dev/null | wc -l)"

		# you can change these
		lc="${reset}${bold}${blue}"         # labels
		nc="${reset}${bold}${blue}"         # user and hostname
		ic="${reset}${bold}"                # info
		c0="${reset}${blue}"                # first color

## OUTPUT

cat <<EOF

${c0}        /\\         ${nc}${USER}${ic}@${nc}${host}${reset}
${c0}       /  \\        ${lc}OS:        ${ic}${os}${reset}
${c0}      /\\   \\       ${lc}KERNEL:    ${ic}${kernel}${reset}
${c0}     /  __  \\      ${lc}UPTIME:    ${ic}${uptime}${reset}
${c0}    /  (  )  \\     ${lc}PACKAGES:  ${ic}${packages}${reset}
${c0}   / __|  |__\\\\    ${lc}SHELL:     ${ic}${shell}${reset}
${c0}  /.\`        \`.\\   ${lc}${uitype}:        ${ic}${ui}${reset}

EOF
		;;
	*)
		packages='unknown'

		# you can change these
		lc="${reset}${bold}"                # labels
		nc="${reset}${bold}"                # user and hostname
		ic="${reset}${bold}"                # info
		c0="${reset}${black}"               # first color
		c1="${reset}${white}"               # second color
		c2="${reset}${yellow}"              # third color

## OUTPUT

cat <<EOF

${c0}      ___     ${nc}${USER}${ic}@${nc}${host}${reset}
${c0}     (${c1}.. ${c0}\    ${lc}OS:        ${ic}${os}${reset}
${c0}     (${c2}<> ${c0}|    ${lc}KERNEL:    ${ic}${kernel}${reset}
${c0}    /${c1}/  \\ ${c0}\\   ${lc}UPTIME:    ${ic}${uptime}${reset}
${c0}   ( ${c1}|  | ${c0}/|  ${lc}PACKAGES:  ${ic}${packages}${reset} 
${c2}  _${c0}/\\ ${c1}__)${c0}/${c2}_${c0})  ${lc}SHELL:     ${ic}${shell}${reset}
${c2}  \/${c0}-____${c2}\/${reset}   ${lc}${uitype}:        ${ic}${ui}${reset}

EOF
		;;
esac

pcs() { for i in {0..7}; do echo -en "\e[${1}$((30+$i))m \u2588\u2588 \e[0m"; done; }
printf "\n%s\n%s\n\n" "$(pcs)" "$(pcs '1;')"
