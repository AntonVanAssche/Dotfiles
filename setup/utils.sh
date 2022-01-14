#!/bin/bash

function AskForSudo() {

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

function OSCheck() {
   # System checks
   OS="$(. /etc/os-release && echo $NAME)"

   case $OS in
      "Ubuntu"| "Gomez OS")
         message info "$OS detected, which is supported."
         ;;
      "Fedora Linux")
         message info "$OS detected, which is supported."
         ;;
      *)
         message error "This system is not supported."
         exit 1
         ;;
   esac
}