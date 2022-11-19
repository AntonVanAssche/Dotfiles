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

    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"${keybinds[0]}" binding 'F10'
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"${keybinds[0]}" command 'spotify'
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"${keybinds[0]}" name 'Launch Spotify'

    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"${keybinds[1]}" binding 'F11'
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"${keybinds[1]}" command 'bash /home/anton/.local/bin/spotifynotifications'
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"${keybinds[1]}" name 'Spotify notification'

    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"${keybinds[2]}" binding '<Super>t'
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"${keybinds[2]}" command 'alacritty'
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"${keybinds[2]}" name 'Launch Alacritty'

    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"${keybinds[3]}" binding '<Shift><Super>r'
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"${keybinds[3]}" command 'killall -HUP gnome-shell'
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"${keybinds[3]}" name 'Reload gnome-shell'

    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"${keybinds[4]}" binding '<Super>slash'
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"${keybinds[4]}" command 'rofi -show drun'
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"${keybinds[4]}" name 'Launch Rofi in run mode'
}

Execute "SetKeybindings" "Setting custom keybindings"
