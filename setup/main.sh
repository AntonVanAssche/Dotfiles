#!/bin/bash

# Abort if error.
set -e

cd $HOME
dotfilesDir="$HOME/dotfiles"

date=$(date +"%d-%m-%Y")
date=$(date +"%T")

LogDir="$dotfilesDir/log"
LogFile="$logDir/$date-$time.log"

# Create the logDir if no exists.
mkdir -p $logDir

function Main() {
   source $dotfilesDir/setup/utils.sh

   OSCheck
   AskForSudo

   # Install dotfiles.
   message info "Setting up dotfiles."
   source $dotfilesDir/setup/dotfiles.sh

   # Install all packages.
   message info "Installing packages..."
   source $dotfilesDir/setup/packages.sh

   # Ask to configure a static ip-adress.
   message quest "Do you want to setup a static ip address? [y/N]"
   read -p " " ipYN
   case $ipYN in
      "YES"| "yes" | "Y"| "N"| "No"| "nO") source $dotfilesDir/setup/ip.sh;;
      *) return;;
   esac

   # If Gnome-shell is detected ask to setup.
   if [[ $(command -v gnome-shell) ]]; then
      message quest "Do you want to setup Gnome-shell? [Y/n]"
      read -p " " gnomeShell
      case $gnomeShell in
         "NO"| "no" | "N"| "n"| "No"| "nO") return;;
         *) source $dotfilesDir/setup/gnome.sh;;
      esac
   fi

   # If done ask to reboot.
   message quest "Do you want to reboot the system? [y/n]"
   read -p " " restart
   if [[ $restart = "y" || $restart = "Y" ]] ; then
      sudo systemctl reboot
   fi
}

time Main 2>&1 | tee -a "$logFile"
