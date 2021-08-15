#!/bin/bash

function ASK_FOR_SUDO() {

    # Ask for the administrator password upfront.

    sudo -v &> /dev/null

    # Update existing `sudo` time stamp
    # until this script has finished.
    #
    # https://gist.github.com/cowboy/3118588

    while true; do
        sudo -n true
        sleep 60
        kill -0 "$$" || exit
    done &> /dev/null &

}

function message() {
   # $1 = type , $2 = message
   # Message types
   # info
   # warning
   # error
   if [[ -z "${1}" ]] || [[ -z "${2}" ]]; then
      return
   fi

   local RED="\e[31m"
   local GREEN="\e[32m"
   local YELLOW="\e[33m"
   local MAGENTA="\e[35m"
   local RESET="\e[0m"
   local MESSAGE_TYPE=""
   local MESSAGE=""
   MESSAGE_TYPE="${1}"
   MESSAGE="${2}"

   case ${MESSAGE_TYPE} in
      info) echo -e "  [${GREEN}i${RESET}] INFO: ${MESSAGE}";;
      quest) echo -en "  [${GREEN}?${RESET}] INPUT: ${MESSAGE}";;
      warn) echo -e "  [${YELLOW}*${RESET}] WARNING: ${MESSAGE}";;
      error) echo -e "  [${RED}!${RESET}] ERROR: ${MESSAGE}";;
      *) echo -e "  [?] UNKNOWN: ${MESSAGE}";;
   esac
}

function OS_CHECK() {
   # System checks
   OS_CODENAME=$(lsb_release --codename --short)
   OS_ID=$(lsb_release --id --short)

   if [[ $(which lsb_release) ]] 1>/dev/null; then
      message info "lsb_release detected."
   else
      message error "lsb_release not detected. Quitting."
      exit 1
   fi

   if [[ "${OS_ID}" == "Ubuntu" || "${OS_ID}" == "Raspbian" ||"${OS_ID}" == "Debian" ]]; then
      message info "${OS_ID} detected, which is supported."
   else
      message error "${OS_ID} detected, which is not supported."
      exit 1
   fi
}

function STATIC_IP() {
   message quest "Do you want to setup a static ip address? [y/n]"
   read -p " " IP
   if [[ $IP == "y" || $IP == "Y" ]]; then
      source $DOTFILES/setup/ip.sh
   fi
}

function GNOME() {
   if [[ $(which gnome-shell) ]]; then
      message quest "Do you want to setup Gnome-shell? [y/n]"
      read -p " " GNOME_SHELL
      if [[ $GNOME_SHELL == "y" || $GNOME_SHELL == "Y" ]]; then
         source $DOTFILES/setup/gnome.sh
      fi
   fi
}

function REBOOT() {
   message quest "Do you want to reboot the system? [y/n]"
   read -p " " REBOOT
   if [[ $REBOOT = "y" || $REBOOT = "Y" ]] ; then
      sudo systemctl reboot
   fi
}
