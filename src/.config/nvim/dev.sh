#!/usr/bin/env bash

# Make sure you execute this script from within this directory (src/.config/nvim).
mv ~/.config/nvim/ ~/.config/nvim-backup/
ln -s "$(pwd)" ~/.config/
ls -la ~/.config/nvim/
