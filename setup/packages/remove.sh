#!/bin/bash

printf "%b" "\n${blue} • Remove Packages${normal}\n"

packagesToRemove=(*libreoffice* rhythmbox gnome-tour gnome-boxes *qemu* gnome-photos)

for packageToRemove in "${packagesToRemove[@]}";
do
    RemovePackage "${packageToRemove}" "Removing ${packageToRemove}"
done
