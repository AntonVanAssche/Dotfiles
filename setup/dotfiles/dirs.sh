#!/bin/bash

printf "%b" "\n${blue} • Create directories${normal}\n"

Execute "mkdir -p $HOME/Projects/" "Creating $HOME/Projects/"
Execute "mkdir -p $HOME/Downloads/torrents" "Creating $HOME/Downloads/torrents"
Execute "mkdir -p $HOME/isos" "Creating $HOME/isos"