#!/bin/bash

printf "%b" "\n${blue} • Keybindings${normal}\n"

SetKeybindings() {
    # Set custom keybindings
    keybinds=(
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/"
    )

    stringKeybinds="["
    for keybind in "${keybinds[@]}";
    do
        stringKeybinds="${stringKeybinds}'${keybind}', "
    done
    [[ "$stringKeybinds" != '' ]] && stringKeybinds="${stringKeybinds:0:-2}]"

    gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "${stringKeybinds}"

    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"${keybinds[0]}" binding '<Super>t'
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"${keybinds[0]}" command 'env -u WAYLAND_DISPLAY alacritty'
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"${keybinds[0]}" name 'Launch Alacritty'

    # Doesn't work on Wayland:
    # gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"${keybinds[3]}" binding '<Shift><Super>r'
    # gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"${keybinds[3]}" command 'killall -HUP gnome-shell'
    # gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"${keybinds[3]}" name 'Reload gnome-shell'

    # Doesn't work on Wayland:
    # gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"${keybinds[4]}" binding '<Super>slash'
    # gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"${keybinds[4]}" command 'rofi -show drun'
    # gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"${keybinds[4]}" name 'Launch Rofi in run mode'
}

Execute "SetKeybindings" "Setting custom keybindings"
