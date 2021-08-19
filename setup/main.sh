#!/bin/bash

# Abort if error.
set -e

cd $HOME
DOTFILES="$HOME/dotfiles"

DATE=$(date +"%d-%m-%Y")
TIME=$(date +"%T")

LOG_DIR="$DOTFILES/log"
LOG_FILE="$LOG_DIR/$DATE-$TIME.log"

# Create the LOG_DIR if no exists.
mkdir -p $LOG_DIR


function main() {
   source $DOTFILES/setup/utils.sh

   OS_CHECK
   ASK_FOR_SUDO

   # Install dotfiles.
   message info "Setting up dotfiles."
   source $DOTFILES/setup/dotfiles.sh

   # Install all packages.
   message info "Installing packages..."
   PACKAGES

   # Ask to configure a static ip-adress.
   STATIC_IP

   # If Gnome-shell is detected ask to setup.
   GNOME

   # If done ask to reboot.
   REBOOT
}

main | tee -a "$LOG_FILE"
