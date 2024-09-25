#!/usr/bin/env bash

set -o errexit  # Abort on nonzero exit code.
set -o nounset  # Abort on unbound variable.
set -o pipefail # Don't hide errors within pipes.
# set -o xtrace # Enable for debugging.

DOTFILES_DIR="${HOME}/Projects/Dotfiles"
mkdir -p "${HOME}/Pictures/"
if [[ ! -h "${HOME}/Pictures/Wallpapers" ]]; then
    [[ -d "${HOME}/Pictures/Wallpapers" ]] || rm -rf "${HOME}/Pictures/Wallpapers/"
    ln -sfv "${DOTFILES_DIR}/walls" "${HOME}/Pictures/Wallpapers"
fi

declare -a DNF=(dnf --assumeyes)
declare -a PKGS_TO_INSTALL=(
    'hyprland'
    'hyprpaper'
    'swaylock'
    'grim'
    'nm-connection-editor'
    'blueman'
    'pavucontrol'
    'lxappearance'
    'rofu-wayland'
    'dunst'
    'zathura'
    'zathura-pdf-poppler'
    'ranger'
    'kitty'
    'fira-code-fonts'
    'numix-icon-theme-circle'
    'la-capitaine-cursor-theme'
)

sudo "${DNF[@]}" install "${PKGS_TO_INSTALL[@]}"

(
    git clone git@github.com:AntonVanAssche/Catppuccin-GTK-Theme.git
    cd Catppuccin-GTK-Theme/
    [[ -d ".icons" ]] && cp -r icons/ "${HOME}/.icons/"
    [[ -f "themes/install.sh" ]] && bash themes/install.sh -l -t default --tweaks macchiato
)

declare -a FONTS=()
while IFS= read -r -d '' FONT; do
    cp -v "${FONT}" "${HOME}/.local/share/fonts/"
done < <(find "${DOTFILES_DIR}/fonts/" -type f -name "*.ttf" -print0)

for font in "${FONTS[@]}"; do
    cp -v "${font}" "${HOME}/.local/share/fonts/"
done

fc-cache -f
