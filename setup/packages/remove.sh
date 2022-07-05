#!/bin/bash

printf "%b" "\n${blue} • Remove Packages${normal}\n"

packagesToRemove=(
   # LibreOffice Stuff.
   libreoffice-calc
   libreoffice-core
   libreoffice-draw
   libreoffice-data
   libreoffice-emailmerge
   libreoffice-impress
   libreoffice-filters
   libreoffice-graphicfilter
   libreoffice-gtk3
   libreoffice-help-en
   libreoffice-langpack-en
   libreoffice-ogltrans
   libreoffice-opensymbol-fonts
   libreoffice-pdfimport
   libreoffice-pyuno
   libreoffice-ure
   libreoffice-ure-common
   libreoffice-writer
   libreoffice-x11
   libreoffice-xsltfilter
   unoconv

   # Rythembox.
   rhythmbox

   # Gnome stuff I don't use.
   gnome-tour
   gnome-boxes
   gnome-photos
   gnome-connections

   # Fedora stuff I don't use.
   mediawriter
)

for packageToRemove in "${packagesToRemove[@]}";
do
   RemovePackage "${packageToRemove}" "Removing ${packageToRemove}"
done
