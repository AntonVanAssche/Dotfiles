#!/bin/bash

printf "%b" "\n${blue} • Privacy${normal}\n"

# Privacy settings
Execute "gsettings set org.gnome.desktop.privacy remember-recent-files false" "Applying privacy settings"
