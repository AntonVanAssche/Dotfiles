#!/bin/bash

# Abort if error.
set -eu

function FedoraGnome() {
   message info "Installing gnome-tweaks..."; sudo dnf install gnome-tweaks -y
   message info "Installing Flat-remix theme..."; sudo dnf copr enable daniruiz/flat-remix -y && sudo dnf install gnome-shell-theme-flat-remix flat-remix-gnome -y
   message info "Installing numix-icon-theme-circle..."; sudo dnf install numix-icon-theme-circle -y
   message info "Installing cursor theme..."; mkdir -p .icons/ && cp -r "$dotfilesDir"/cursor/* .icons/
   message info "Installing pywal..."; pip3 install pywal
   message info "Installing ulauncher"; sudo dnf install ulauncher -y
   message info "Installing imagemagick..."; sudo dnf install glib2-devel ImageMagick -y
   message info "Installing pop-shell..."; sudo dnf install gnome-extensions-app nodejs-typescript gnome-shell-extension-pop-shell xprop -y
}

function UbuntuGnome() {
   message info "Installing gnome-tweaks..."; sudo apt install gnome-tweaks gnome-shell-extensions -y
   message info "Installing Flat-remix theme..."; sudo add-apt-repository ppa:daniruiz/flat-remix -y && sudo apt update && sudo apt install flat-remix-gnome flat-remix-gtk -y
   message info "Installing numix-icon-theme-circle..."; sudo add-apt-repository ppa:numix/ppa -y && sudo apt update && sudo apt install numix-icon-theme-circle -y
   message info "Installing cursor theme..."; mkdir -p .icons/ && cp -r "$dotfilesDir"/cursor/* .icons/
   message info "Installing pywal..."; pip3 install pywal
   message info "Installing ulauncher"; sudo add-apt-repository ppa:agornostal/ulauncher -y && sudo apt update && sudo apt install ulauncher -y
   message info "Installing imagemagick..."; sudo apt install libglib2.0-dev-bin imagemagick -y
   message info "Installing pop-shell..."; sudo apt-get install node-typescript -y
}

# Install NECESSARY packages.
[[ $OS == "Fedora Linux" ]] && FedoraGnome
[[ $OS == "Ubuntu" ]] && UbuntuGnome
[[ $OS == "Gomez OS" ]] && UbuntuGnome

# Apply theme + icon pack.
message info "Applying theme + icon pack..."
gsettings set org.gnome.desktop.interface gtk-theme "Flat-Remix-GTK-Blue-Dark-Solid"
gsettings set org.gnome.shell.extensions.user-theme name "Flat-Remix-Blue-Dark"
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"
gsettings set org.gnome.desktop.interface icon-theme "Numix-Circle"
gsettings set org.gnome.desktop.interface cursor-theme 'capitaine-cursors'

# Set favorite apps
message info "Setting favorite apps..."
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

# Set custom keybindings
message info "Setting keybindings..."
keybinds=(
   "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
   "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
   "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
   "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/"
   "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/"
)

stringKeybinds="["
for keybind in "${keybinds[@]}";
do
   stringKeybinds="${stringKeybinds}'${keybind}', "
done
[[ "$stringKeybinds" != '' ]] && stringKeybinds="${stringKeybinds:0:-2}]"

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "$stringKeybinds"

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"${keybinds[0]}" binding 'F10'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"${keybinds[0]}" command 'spotify'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"${keybinds[0]}" name 'Launch Spotify'

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"${keybinds[1]}" binding 'F11'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"${keybinds[1]}" command 'bash /home/anton/scripts/spotifynotifications.sh'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"${keybinds[1]}" name 'Spotify notification'

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"${keybinds[2]}" binding '<Super>t'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"${keybinds[2]}" command 'termite'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"${keybinds[2]}" name 'Launch Termite'

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"${keybinds[3]}" binding '<Shift><Super>r'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"${keybinds[3]}" command 'killall -HUP gnome-shell'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"${keybinds[3]}" name 'Reload gnome-shell'

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"${keybinds[4]}" binding '<Super>slash'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"${keybinds[4]}" command 'ulauncher'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:"${keybinds[4]}" name 'Launch Ulauncher'

# Set wallpaper.
wallpaperDir="$HOME"/Pictures/Wallpapers/
mkdir -p "$wallpaperDir"
cp -r dotfiles/wallpapers/* "$wallpaperDir"
message info "select a wallpaper "
message quest "(1) Barbara Palvin \n             (2) Big-Sur \n             (3) Cabin in the woods \n             (4) Chad \n             (5) Keyboards \n             (6) Selena Gomez \n[1/2/3/4/5/6] "
read -r wallpaper
case ${wallpaper} in
   1) gsettings set org.gnome.desktop.background picture-uri "$wallpaperDir"/Barbara-Palvin.jpg;;
   2) gsettings set org.gnome.desktop.background picture-uri "$wallpaperDir"/Big-Sur.jpg;;
   3) wal -i "$wallpaperDir"/Cabin-in-the-woods.jpeg && gsettings set org.gnome.desktop.background picture-uri "$wallpaperDir"/Cabin-in-the-woods.jpeg;;
   4) gsettings set org.gnome.desktop.background picture-uri "$wallpaperDir"/Chad.jpg;;
   5) gsettings set org.gnome.desktop.background picture-uri "$wallpaperDir"/Keyboards.jpg;;
   6) gsettings set org.gnome.desktop.background picture-uri "$wallpaperDir"/Selena-Gomez.jpg;;
   *) message error "$wallpaper is not a valid option!";;
esac

# Privacy
gsettings set org.gnome.desktop.privacy remember-recent-files false

# Install conky + Now Clocking widget.
message info "Installing conky..."
[[ $OS == "Fedora Linux" ]] && sudo dnf install conky ffmpeg playerctl -y
[[ $OS == "Ubuntu" ]] && sudo apt install conky ffmpeg playerctl -y
[[ $OS == "Gomez OS" ]] && sudo apt install conky ffmpeg playerctl -y
git clone https://github.com/TuX-sudo/now-clocking
source ./now-clocking/scripts/download-fonts.sh
mkdir -p "$HOME"/.config/conky/ && mv "$HOME"/now-clocking "$HOME"/.config/conky/
conky -q -c "$HOME"/.config/conky/now-clocking/conky/np.lua -d &> /dev/null
conky -q -c "$HOME"/.config/conky/now-clocking/conky/npart.lua -d &> /dev/null

message info "Installing Gnoti..."
git clone https://github.com/TuX-sudo/gnoti.git
cd gnoti/
gnotiPath="$HOME""/.local/share/gnome-shell/extensions/Gnoti@AntonVA.dev"
mkdir -p "$gnotiPath"
cp -r ./src/* "$gnotiPath"/
sed "30 i Main.messageTray._bannerBin.x = Right.topright(); // Top right" ./src/extension.js &> "$gnotiPath"/extension.js
message info "Files copied to $gnotiPath"
cd "$HOME"

# Install pop-shell
if [[ $OS == "Ubuntu" ]] || [[ $OS == "Gomez OS" ]]; then
   git clone https://github.com/pop-os/shell
   cd shell
   make && make local-install
   cd "$HOME"
fi
