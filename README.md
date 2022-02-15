```
  █▀▀▀ ▀█▀ █   █▀▀ █▀▀
  █▀▀   █  █   █▀▀ ▀▀█
▀ ▀    ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀
```

A bunch of files that start with . and makes linux more awesome.

This is how I set up a new Fedora Linux install.

## Table of Contents

- [System info](#system-info)
- [Installation](#installation)
  - [One-liner](#one-liner)
  - [Cloning the repo](#cloning-the-repo)
  - [Installer preview](#installer-preview)

## System info

<img src="./assets/preview.png" alt="preview" align="right" width="400px">

- OS: [Fedora Linux](https://getfedora.org/)
- DE : [Gnome](https://gitlab.gnome.org/GNOME/gnome-shell)
- GTK Theme: [Flat Remix GTK](https://github.com/daniruiz/flat-remix-gtk)
- Shell Theme: [Flat Remix Gnome](https://github.com/daniruiz/flat-remix-gnome)
- Icon Theme: [Numix Circle](https://github.com/numixproject/numix-icon-theme-circle)
- Wallpaper: [Barbara Palvin](./src/walls/Barbara-Palvin.jpg) (Edited the [original](https://wallpapersden.com/barbara-palvin-photoshoot-for-grazia-italy-2018-wallpaper/) image a little bit to fit the theme)
- Terminal: Termite with [purify color scheme](https://github.com/kyoz/purify/tree/master/termite) and [Ubuntu Mono font](https://design.ubuntu.com/font/)
- Editor : [vim](https://github.com/vim/vim)
  with [purify color scheme](https://github.com/kyoz/purify/tree/master/vim)
- Shell : [Bash](https://www.gnu.org/software/bash/)
- Launcher: Ulauncher with [Flat Remix theme](./src/.config/ulauncher/user-themes/flat-remix-darkest/)
- Music: Spotify with [Custom Dribbblish](./src/.config/spicetify/Themes/Dribbblish) [Spicetify](https://github.com/khanhas/spicetify-cli) theme
- Conky widget: [Now Clocking](https://github.com/AntonVanAssche/now-clocking)

- Gnome-shell extensions:
  - [Alpabetical App Grid](https://github.com/stuarthayhurst/alphabetical-grid-extension)
  - [Bluetooth quick connect](https://github.com/bjarosze/gnome-bluetooth-quick-connect)
  - [Clipboard Indicator](https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator)
  - [Gnome 4x UI Improvements](https://github.com/axxapy/gnome-ui-tune)
  - [Gnoti](https://github.com/AntonVanAssche/gnoti) (Self made)
  - [Hide minimized](https://github.com/danigm/hide-minimized)
  - [Just Perfection](https://gitlab.gnome.org/jrahmatzadeh/just-perfection)
  - [Sound Input & Output Device Chooser](https://github.com/kgshank/gse-sound-output-device-chooser)
  - [Workspace Bar](https://github.com/fthx/workspaces-bar)
    - Customized using dconf Editor: /org/gnome/desktop/wm/preferences/workspace-names -> ['www', 'code', 'music', 'virt', 'misc'] Fixed number of workspaces needed (5)
  - [Pop-Shell](https://github.com/pop-os/shell)
  - Background Logo (Fedora build-in)

## Installation

**⚠️ Warning:** **DO NOT** run the [`setup.sh`](./setup.sh) script if you do not fully understand what it does. Seriously, **DON'T**!

The setup process will:

- Download the dotfiles on your computer.
- Create some additional [directories](./setup/dotfiles/dirs.sh).
- [Copy](./setup/dotfiles/dotfiles.sh) the dotfiles.
- Install [applications](./setup/packages/) / command-line tools for Fedora Linux.
- Set custom Gnome-Shell [preferences](./setup/gnome/).
- Install the [Vim](./setup/packages/devel-tools.sh) plugins.

The setup process will not:

- Install all Gnome-Shell extensions (only [Gnoti](https://github.com/AntonVanAssche/gnoti) and [Pop-Shell](https://github.com/pop-os/shell)).

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
