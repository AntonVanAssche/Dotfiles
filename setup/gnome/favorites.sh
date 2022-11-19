#!/bin/bash

printf "%b" "\n${blue} • Favorite apps${normal}\n"

SetFavoriteApps() {
    # Set favorite apps
    apps=(
        "/usr/share/applications/org.gnome.Nautilus.desktop"
        "/usr/share/applications/firefox.desktop"
        "/usr/share/applications/spotify.desktop"
        "/usr/share/applications/signal-desktop.desktop"
        "/usr/share/applications/discord.desktop"
        "/usr/share/applications/transmission-gtk.desktop"
        "/usr/share/applications/io.github.TransmissionRemoteGtk.desktop"
    )

    stringApps="["
    for app in "${apps[@]}";
    do
        [[ -f "$app" ]] && stringApps="${stringApps}'${app##*/}', "
    done
    [[ "$stringApps" != '' ]] && stringApps="${stringApps:0:-2}]"

    gsettings set org.gnome.shell favorite-apps "$stringApps"
}

Execute "SetFavoriteApps" "Setting favorite apps"
