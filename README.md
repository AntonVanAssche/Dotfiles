```
  █▀▀▀ ▀█▀ █   █▀▀ █▀▀
  █▀▀   █  █   █▀▀ ▀▀█
▀ ▀    ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀
```

A bunch of files that start with . and makes linux more awesome.

This is how I set up a new Fedora Linux install.

## Table of Contents

-  [System info](#system-info)
-  [Installation](#installation)
   -  [One-liner](#one-liner)
   -  [Cloning the repo](#cloning-the-repo)
   -  [Installer preview](#installer-preview)

## System info

<img src="./assets/TateMcRaePreview.png" alt="preview" align="right" width="400px">

-  OS: [Fedora Linux](https://getfedora.org/)
-  DE : [Gnome](https://gitlab.gnome.org/GNOME/gnome-shell)
-  GTK Theme: [Adw-gtk3-dark](https://github.com/lassekongo83/adw-gtk3)
-  Shell Theme: Default Gnome
-  Icon Theme: [Numix Circle](https://github.com/numixproject/numix-icon-theme-circle)
-  Wallpaper: [Big Sur](./src/walls/Big-Sur.jpg)
-  Terminal: Termite with [onedark color scheme](./src/.config/termite/config) and [Ubuntu Mono font](https://design.ubuntu.com/font/)
-  Editor : [vim](https://github.com/vim/vim)
   with [onedark color scheme](https://github.com/joshdick/onedark.vim)
-  Shell : [Bash](https://www.gnu.org/software/bash/)
-  Launcher: Ulauncher with Adwaita theme (built-in)
-  Music: Spotify with [Custom Dribbblish](./src/.config/spicetify/Themes/Dribbblish) [Spicetify](https://github.com/khanhas/spicetify-cli) theme
-  Conky widget: [Now Clocking](https://github.com/AntonVanAssche/now-clocking)

-  Gnome-shell extensions:
   -  [Alpabetical App Grid](https://github.com/stuarthayhurst/alphabetical-grid-extension)
   -  [Bluetooth quick connect](https://github.com/bjarosze/gnome-bluetooth-quick-connect)
   -  [Clipboard Indicator](https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator)
   -  [Gnome 4x UI Improvements](https://github.com/axxapy/gnome-ui-tune)
   -  [Gnoti](https://github.com/AntonVanAssche/gnoti) (Self made)
   -  [Hide minimized](https://github.com/danigm/hide-minimized)
   -  [Just Perfection](https://gitlab.gnome.org/jrahmatzadeh/just-perfection)
   -  [Sound Input & Output Device Chooser](https://github.com/kgshank/gse-sound-output-device-chooser)
   -  [Workspace Bar](https://github.com/fthx/workspaces-bar)
      -  Customized using dconf Editor: /org/gnome/desktop/wm/preferences/workspace-names -> ['www', 'code', 'music', 'virt', 'misc'] Fixed number of workspaces needed (5)
   -  [Pop-Shell](https://github.com/pop-os/shell)

## Installation

**⚠️ Warning:** **DO NOT** run the [`setup.sh`](./setup.sh) script if you do not fully understand what it does. Seriously, **DON'T**!

The setup process will:

-  Download the dotfiles on your computer.
-  Create some additional [directories](./setup/dotfiles/dirs.sh).
-  [Copy](./setup/dotfiles/dotfiles.sh) the dotfiles.
-  Install [applications](./setup/packages/) / command-line tools for Fedora Linux.
-  Set custom Gnome-Shell [preferences](./setup/gnome/).
-  Install the [Vim](./setup/packages/devel-tools.sh) plugins.

The setup process will not:

-  Install all Gnome-Shell extensions (only [Gnoti](https://github.com/AntonVanAssche/gnoti) and [Pop-Shell](https://github.com/pop-os/shell)).

### One-liner

```bash
$ bash -c "$(wget -qO - https://raw.githubusercontent.com/AntonVanAssche/dotfiles/master/setup.sh)"
```

### Cloning the repo:

```bash
$ git clone https://github.com/AntonVanAssche/dotfiles.git
$ cd dotfiles
$ bash setup.sh
```

### Installer preview

![Installer preview](./assets/installer-preview.gif)
