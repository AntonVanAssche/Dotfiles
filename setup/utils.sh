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
   OS="$(hostnamectl | grep "Operating System: " | sed -e "s/Operating System: //")"
   UBUNTU="0"
   FEDORA="0"
   ARCH="0"

   case $OS in
      "  Ubuntu"*)
         message info "Ubuntu detected, which is supported."
         UBUNTU="1"
         ;;
      "  Fedora 34"*)
         message info "Fedora detected, which is supported."
         FEDORA="1"
         ;;
      "Arch Linux")
         message info "Arch Linux detected, which is supported."
         ARCH="1"
         ;;
      *)
         message error "This system is not supported."
         exit 1
         ;;
   esac
}

function PACKAGES() {
   if [[ $UBUNTU == "1" ]]; then
	  source $DOTFILES/setup/ubuntu/packages.sh
   fi

   if [[ $FEDORA == "1" ]]; then
      source $DOTFILES/setup/fedora/packages.sh
   fi

   if [[ $ARCH == "1" ]]; then
      source $DOTFILES/setup/arch/packages.sh
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
         if [[ $ARCH == "1" ]]; then
		      source $DOTFILES/setup/ubuntu/gnome.sh
         fi

         if [[ $FEDORA == "1" ]]; then
            source $DOTFILES/setup/fedora/gnome.sh
         fi

         if [[ $ARCH == "1" ]]; then
            source $DOTFILES/setup/arch/gnome.sh
         fi
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
