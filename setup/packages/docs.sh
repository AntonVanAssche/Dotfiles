#!/bin/bash

printf "%b" "\n${blue} • Document editors${normal}\n"

Execute "sudo dnf install https://download.onlyoffice.com/repo/centos/main/noarch/onlyoffice-repo.noarch.rpm -y" "Adding onlyoffice repo"
InstallPackage "onlyoffice-desktopeditors" "Installing onlyoffice"
