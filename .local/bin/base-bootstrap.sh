#!/usr/bin/env bash

set -o errexit  # Abort on nonzero exit code.
set -o nounset  # Abort on unbound variable.
set -o pipefail # Don't hide errors within pipes.
# set -o xtrace # Enable for debugging.

###########
# Sudoers #
###########

declare -r SUDOERS_FILE="/etc/sudoers.d/${USER}"

if visudo -cqf ".${SUDOERS_FILE}"; then
    sudo install -vCDZ -m 0440 -o root -g root "./${SUDOERS_FILE}" "${SUDOERS_FILE}"
else
    pritnf "%s\n" "Error: Failed to validate sudoers file." >&2
fi

#####################
# DNF Configuration #
#####################

if [[ -f /etc/dnf.conf ]]; then
    sudo mv -v /etc/dnf.conf /etc/dnf.conf.bak
fi

sudo install -vCDZ -m 0644 -o root -g root ./etc/dnf.conf /etc/dnf.conf

############
# Packages #
############

declare -a DNF=(dnf --assumeyes)
declare -a REPOS_TO_ADD=(
    "https://download.opensuse.org/repositories/network:/im:/signal/Fedora_$(rpm -E %fedora)/network:im:signal.repo"
    'https://negativo17.org/repos/fedora-spotify.repo'
    'https://rpm.releases.hashicorp.com/fedora/hashicorp.repo'
)
declare -r PUPPET_RELEASE_PACKAGE_URL=http://yum.puppetlabs.com/puppet7-release-fedora-36.noarch.rpm
declare -a PKGS_TO_REMOVE=(
    'libreoffice-calc'
    'libreoffice-core'
    'libreoffice-draw'
    'libreoffice-data'
    'libreoffice-emailmerge'
    'libreoffice-impress'
    'libreoffice-filters'
    'libreoffice-graphicfilter'
    'libreoffice-gtk3'
    'libreoffice-help-en'
    'libreoffice-langpack-en'
    'libreoffice-ogltrans'
    'libreoffice-opensymbol-fonts'
    'libreoffice-pdfimport'
    'libreoffice-pyuno'
    'libreoffice-ure'
    'libreoffice-ure-common'
    'libreoffice-writer'
    'libreoffice-x11'
    'libreoffice-xsltfilter'
    'unoconv'
    'rhythmbox'
    'gnome-tour'
    'gnome-boxes'
    'gnome-photos'
    'gnome-connections'
    'gnome-terminal'
    'gedit'
    'mediawriter'
)
declare -a PKGS_TO_INSTALL=(
    'alacritty'
    'neovim'
    'tmux'
    'fzf'
    'htop'
    'wireguard-tools'
    'openresolv'
    'mpv'
    'mpv-libs'
    'python3-pip'
    'wget'
    'curl'
    'VirtualBox'
    'vagrant'
    'terraform'
    'bat'
    'nodejs'
    'meson'
    'sassc'
    'signal-desktop'
    'discord'
    'spotify-client'
    'playerctl'
    'puppet7-release'
    'puppet-agent'
    '@Development tools'
    '@Development Libraries'
)
declare -a NPM_PKGS=(
    "neovim"
    "@fsouza/prettierd"
    "markdownlint-cli2"
)
declare -a PIP_PKGS=(
    "ansible-lint"
    "black"
    "isort"
    "neovim"
    "pynvim"
    "yamlfix"
)
declare -a GEMS=(
    "puppet-lint"
    "puppet-editor-services"
    "rubocop"
)

for repo in "${REPOS_TO_ADD[@]}"; do
    sudo "${DNF[@]}" config-manager --add-repo "${repo}"
done

sudo "${DNF[@]}" install \
    "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" \
    "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm" \
    "${PUPPET_RELEASE_PACKAGE_URL}" \

sudo "${DNF[@]}" update
sudo "${DNF[@]}" remove "${PKGS_TO_REMOVE[@]}"
sudo "${DNF[@]}" install "${PKGS_TO_INSTALL[@]}"

sudo npm install --global "${NPM_PKGS[@]}"
pip3 install --user "${PIP_PKGS[@]}"
gem install "${GEMS[@]}"

####################
# Base directories #
####################

declare -a BASE_DIRS=(
    "${HOME}/Documents/"
    "${HOME}/Downloads/"
    "${HOME}/Downloads/Torrents/"
    "${HOME}/Music/"
    "${HOME}/Pictures/"
    "${HOME}/Pictures/Screenshots/"
    "${HOME}/Projects"
    "${HOME}/Videos/"
    "${HOME}/Videos/Screencasts/"
    "${HOME}/isos"
)

mkdir -vp "${BASE_DIRS[@]}"

##################
# Configurations #
##################

DOTFILES_DIR="${HOME}/Projects/Dotfiles"
CONFIG_DIR=".config"
LOCAL_BIN_DIR=".local/bin"
declare -r CONFIG_DIR LOCAL_BIN_DIR
declare -a CONFIG_DIRS_TO_LINK=()
declare -a LOCAL_BIN_FILES_TO_LINK=()

while IFS='' read -r dir; do
    CONFIG_DIRS_TO_LINK+=("${dir}")
done < <(find "${DOTFILES_DIR}/${CONFIG_DIR}" -mindepth 1 -maxdepth 1 -type d)

while IFS='' read -r bin; do
    LOCAL_BIN_FILES_TO_LINK+=("${bin}")
done < <(find "${DOTFILES_DIR}/${LOCAL_BIN_DIR}" -mindepth 1 -maxdepth 1 -type f)

mkdir -p "${HOME}/${CONFIG_DIR}"
for dir in "${CONFIG_DIRS_TO_LINK[@]}"; do
    ln -sfv "${dir}" "${HOME}/${CONFIG_DIR}/${dir##*/}"
done

mkdir -p "${HOME}/${LOCAL_BIN_DIR}"
for bin in "${LOCAL_BIN_FILES_TO_LINK[@]}"; do
    ln -sfv "${bin}" "${HOME}/${LOCAL_BIN_DIR}/${bin##*/}"
done

ln -sfv "${DOTFILES_DIR}/.bashrc" "${HOME}/.bashrc"
ln -sfv "${DOTFILES_DIR}/.bash_profile" "${HOME}/.bash_profile"
ln -sfv "${DOTFILES_DIR}/.bashrc.d" "${HOME}/.bashrc.d"
