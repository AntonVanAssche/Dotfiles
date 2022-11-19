#!/bin/bash

printf "%b" "\n${blue} • Devel tools${normal}\n"

# Add termite repo.
# Execute " sudo dnf copr enable skidnik/termite -y" "Adding termite repo"

# Add vagrant repo.
Execute "sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo" "Adding vagrant RPM repository"

# Install packages.
packagesToInstall=(
    doas
	# termite
    alacritty
    cargo
    # vim-enhanced
    neovim
    tmux
    lsd
    htop
    wol
    wireguard-tools
    openresolv
    mpv
    mpv-libs
    python3-pip
    java-latest-openjdk.x86_64
    wget
    curl
    VirtualBox
    vagrant
    ninja-build
    meson
    sassc
    most
    bat
    golang
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

# Vim plugins. (Uncomment if you want to install vim plugins)
# rm -rf "$HOME"/.vim/autoload/plug.vim
# Execute "curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" "Installing vim-plug for vim"
# command -v vim &> /dev/null && vim +PlugInstall +qall

# Neovim plugins.
Execute "git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim" "Installing packer.nvim"
command -v pip3 &> /dev/null && Execute "pip3 install pynvim" "Fixing neovim 'Failed to load python3 host' error" # See https://github.com/fsharp/vim-fsharp/issues/96 for more info.

# Copy config to '/etc/doas.conf'.
doasConfigLocation="/etc/doas.conf"
sudo cp -r "${dotfilesDirectory}/src/doas/doas.conf" "${doasConfigLocation}"

# When npm is installed, install the following packages.
if command -v npm &> /dev/null; then
    npmPackagesToInstall=(
        live-server
        speed-test
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

