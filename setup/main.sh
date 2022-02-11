#!/bin/bash

# Abort if error.
set -eu

cd "$HOME"
dotfilesDir="$HOME/dotfiles"

date=$(date +"%d-%m-%Y")
time=$(date +"%T")

logDir="$dotfilesDir/log"
logFile="$logDir/$date-$time.log"

# Create the logDir if no exists.
mkdir -p "$logDir"

function Main() {
   source "$dotfilesDir"/setup/utils.sh

   OSCheck
   AskForSudo

   # Install dotfiles.
   message info "Setting up dotfiles."
   source "$dotfilesDir"/setup/dotfiles.sh

   # Install all packages.
   message info "Installing packages..."
   source "$dotfilesDir"/setup/packages.sh

   # If Gnome-shell is detected ask to setup.
   if [[ $(command -v gnome-shell) ]]; then
      message info "Gnome-shell detected."
      message quest "Do you want to setup Gnome-shell? [Y/n] "
      read -r gnomeShell
      case $gnomeShell in
         [Nn]) message info "Script won't configure Gnome-shell settings";;
         *) source "$dotfilesDir"/setup/gnome.sh;;
      esac
   fi

   # Ask to configure a static ip-adress.
   message quest "Do you want to setup a static ip address? [y/N] "
   read -r ipYN
   case $ipYN in
      [Yy]) source "$dotfilesDir"/setup/ip.sh;;
      *) message info "Script won't configure network settings";;
   esac
}

time Main 2>&1 | tee -a "$logFile"
