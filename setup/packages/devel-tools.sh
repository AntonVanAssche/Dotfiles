#!/bin/bash

printf "%b" "\n${blue} • Devel tools${normal}\n"

# Add termite repo.
# Execute " sudo dnf copr enable skidnik/termite -y" "Adding termite repo"

# Add vagrant repo.
Execute "sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo" "Adding vagrant RPM repository"

# Install packages.
packagesToInstall=(
    alacritty
    cargo
    vim
    neovim
    tmux
    htop
    wol
    wireguard-tools
    openresolv
    mpv
    mpv-libs
    python3-pip
    java-latest-openjdk
    wget
    curl
    VirtualBox
    vagrant
    bat
    nodejs
    )

for packageToInstall in "${packagesToInstall[@]}";
do
    InstallPackage "${packageToInstall}" "Installing ${packageToInstall}"
done

# Install Development tools.
Execute "sudo dnf groupinstall 'Development Tools'" "Installing development tools"

# Install Development libraries.
Execute "sudo dnf groupinstall 'Development Libraries'" "Installing development libraries"

# Neovim plugins.
Execute "git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim" "Installing packer.nvim"
command -v pip3 &> /dev/null && Execute "pip3 install pynvim" "Fixing neovim 'Failed to load python3 host' error" # See https://github.com/fsharp/vim-fsharp/issues/96 for more info.

# Update `sudoers` file.
sudo cp -r "${dotfilesDirectory}/src/sudoers.d/anton" "/etc/sudoers.d/"
sudo chown root:root "/etc/sudoers.d/anton"
sudo chmod 640 "/etc/sudoers.d/anton"

# When npm is installed, install the following packages.
if command -v npm &> /dev/null; then
    npmPackagesToInstall=(
        live-server
        neovim
        )

    for npmPackageToInstall in "${npmPackagesToInstall[@]}";
    do
        Execute "sudo npm install -g ${npmPackageToInstall}" "Installing ${npmPackageToInstall} (npm)"
    done
fi

# When the tmux plugins aren't installed when cloning the repo, install them.
if [[ ! -d "${HOME}/.config/tmux/plugins/tmux-continuum/" ]] || [[ ! -d "${HOME}/.config/tmux/plugins/tmux-resurrect" ]]; then
    Execute "git clone --quiet https://github.com/tmux-plugins/tmux-continuum ~/.config/tmux/plugins/tmux-continuum/" "Installing tmux-continuum"
    Execute "git clone --quiet https://github.com/tmux-plugins/tmux-resurrect ~/.config/tmux/plugins/tmux-resurrect/" "Installing tmux-resurrect"
fi

