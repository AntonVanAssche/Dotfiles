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
   Packages

   # Ask to configure a static ip-adress.
   StaticIp

   # If Gnome-shell is detected ask to setup.
   Gnome

   # If done ask to reboot.
   Reboot
}

time Main 2>&1 | tee -a "$logFile"
