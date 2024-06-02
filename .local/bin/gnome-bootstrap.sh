#!/usr/bin/env bash

set -o errexit  # Abort on nonzero exit code.
set -o nounset  # Abort on unbound variable.
set -o pipefail # Don't hide errors within pipes.
# set -o xtrace # Enable for debugging.

array_to_string() {
    local entry
    local str=""

    for entry in "${@}"; do
        [[ "${entry}" =~ .*\.desktop ]] && ! test -f "/usr/share/applications/${entry}" && continue
        str="${str}'${entry}', "
    done

    if [[ -n "${str}" ]]; then
        printf "[%s]" "${str:0:-2}"
    else
        printf "[]"
    fi
}

DOTFILES_DIR="${HOME}/Projects/Dotfiles"
mkdir -p "${HOME}/Pictures/"
ln -sfv "${DOTFILES_DIR}/walls" "${HOME}/Pictures/Wallpapers"

declare -a DNF=(dnf --assumeyes)
declare -a PKGS_TO_INSTALL=(
    'gnome-tweaks'
    'gnome-extensions-app'
    'numix-icon-theme-circle'
    'la-capitaine-cursor-theme'
    'glib2-devel'
    'ImageMagick'
    'nodejs-typescript'
    'gnome-shell-extension-pop-shell'
    'xprop'
    'dconf-editor'
    'conky'
    'cabextract'
    'xorg-x11-font-utils'
    'https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm'
)
declare -a PIPE_PKGS=(
    'psutil'
)

sudo "${DNF[@]}" install "${PKGS_TO_INSTALL[@]}"
pip3 install "${PIPE_PKGS[@]}"

[[ -d /tmp/adw-gtk3 ]] || (
    git clone https://github.com/lassekongo83/adw-gtk3.git /tmp/adw-gtk3
    cd /tmp/adw-gtk3
    meson build
    sudo ninja -C build install
)

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3-dark'
gsettings set org.gnome.desktop.interface icon-theme 'Numix-Circle'
gsettings set org.gnome.desktop.interface cursor-theme 'capitaine-cursors'
gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close'
gsettings set org.gnome.desktop.background picture-uri "file:///home/${USER}/Pictures/Wallpapers/Tate-McRae-1.jpg"
gsettings set org.gnome.desktop.background picture-uri-dark "file:///home/${USER}/Pictures/Wallpapers/Tate-McRae-1.jpg"

gsettings set org.gnome.desktop.default-applications.terminal exec 'alacritty'

declare -a WORKSPACES=(
    'Browser'
    'Code'
    'Music'
    'Virt'
    'Misc'
)
declare -a FAV_APPS=(
    'org.gnome.Nautilus.desktop'
    'firefox.desktop'
    'spotify.desktop'
    'signal-desktop.desktop'
    'discord.desktop'
    'transmission-gtk.desktop'
    'io.github.TransmissionRemoteGtk.desktop'
)

gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces 5
gsettings set org.gnome.desktop.wm.preferences workspace-names "$(array_to_string "${WORKSPACES[@]}")"
gsettings set org.gnome.shell favorite-apps "$(array_to_string "${FAV_APPS[@]}")"

FIREFOX_PROFILE_DIR="$(printf '%s' "${HOME}"/.mozilla/firefox/*.default-release)"
mkdir -p "${FIREFOX_PROFILE_DIR}/chrome"
ln -sfv "${DOTFILES_DIR}/firefox/userChrome.css" "${FIREFOX_PROFILE_DIR}/chrome/userChrome.css"

gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
gsettings set org.gnome.nautilus.list-view use-tree-view false
gsettings set org.gnome.nautilus.preferences click-policy 'double'
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'
gsettings set org.gnome.software download-updates false
gsettings set org.gtk.Settings.FileChooser sort-directories-first true

gsettings set org.gnome.desktop.privacy remember-recent-files false

declare -a KEYBINDING_PATHS=(
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/'
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/'
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/'
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/'
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/'
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/'
)

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "$(array_to_string "${KEYBINDING_PATHS[@]}")"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"${KEYBINDING_PATHS[0]}" binding '<Super>t'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"${KEYBINDING_PATHS[0]}" command 'env -u WAYLAND_DISPLAY alacritty'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"${KEYBINDING_PATHS[0]}" name 'Launch Alacritty'

[[ -d "${HOME}/.config/conky" ]] || (
    git clone https://github.com/AntonVanAssche/now-clocking.git "${HOME}/.config/conky/"
    bash "${HOME}/.config/conky/scripts/download-fonts.sh"
    conky -q -c "${HOME}/.config/conky/conky/np.lua" -d
    conky -q -c "${HOME}/.config/conky/conky/npart.lua" -d
)

# Update version to the latest: :%s/v3.1.0/<latest>/g
declare -a FONTS=(
    'https://assets.ubuntu.com/v1/fad7939b-ubuntu-font-family-0.83.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/0xProto.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/3270.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/Agave.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/AnonymousPro.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/Arimo.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/AurulentSansMono.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/BigBlueTerminal.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/BitstreamVeraSansMono.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/CascadiaCode.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/CascadiaMono.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/CodeNewRoman.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/ComicShannsMono.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/CommitMono.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/Cousine.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/D2Coding.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/DaddyTimeMono.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/DejaVuSansMono.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/DroidSansMono.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/EnvyCodeR.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/FantasqueSansMono.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/FiraCode.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/FiraMono.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/FontPatcher.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/GeistMono.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/Go-Mono.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/Gohu.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/Hack.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/Hasklig.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/HeavyData.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/Hermit.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/iA-Writer.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/IBMPlexMono.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/Inconsolata.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/InconsolataGo.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/InconsolataLGC.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/IntelOneMono.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/Iosevka.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/IosevkaTerm.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/IosevkaTermSlab.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/JetBrainsMono.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/Lekton.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/LiberationMono.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/Lilex.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/MartianMono.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/Meslo.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/Monaspace.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/Monofur.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/Monoid.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/Mononoki.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/MPlus.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/NerdFontsSymbolsOnly.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/Noto.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/OpenDyslexic.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/Overpass.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/ProFont.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/ProggyClean.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/RobotoMono.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/ShareTechMono.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/SourceCodePro.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/SpaceMono.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/Terminus.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/Tinos.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/Ubuntu.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/UbuntuMono.zip'
    # 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/VictorMono.zip'
)

mkdir -p /tmp/fonts
for font in "${FONTS[@]}"; do
    font_name="${font##*/}"
    font_name="${font_name%.*}"

    mkdir -p "/tmp/fonts/${font_name}"
    wget --directory-prefix="/tmp/fonts/${font_name}" "${font}"

    [[ "${font}" =~ .*\.zip ]] && unzip -d /tmp/fonts/ "/tmp/fonts/${font##*/}"
    [[ "${font}" =~ .*\.tar ]] && tar -C /tmp/fonts/ -xvf "/tmp/fonts/${font##*/}"
done

find /tmp/fonts/ -type f -name '*.ttf' -exec mv {} "${HOME}/.local/share/fonts/" \;
find /tmp/fonts/ -type f -name '*.otf' -exec mv {} "${HOME}/.local/share/fonts/" \;
fc-cache -f -v
