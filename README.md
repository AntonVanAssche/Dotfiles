```
  █▀▀▀ ▀█▀ █   █▀▀ █▀▀
  █▀▀   █  █   █▀▀ ▀▀█
▀ ▀    ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀
```

A bunch of files that start with `.` and makes linux more awesome.

This is how I set up a new Fedora Linux install.

## Table of Contents

-  [System Info](#system-info)
-  [Installation](#installation)
   -  [One-liner](#one-liner)
   -  [Cloning the repo](#cloning-the-repo)
   -  [Installer preview](#installer-preview)
-  [TODO](#todo)

## System Info

<img src="./assets/TateMcRaePreview.png" alt="preview" align="right" width="400px" style="padding: 30px;">

-  OS: [Fedora Linux](https://getfedora.org/)
-  DE : [Gnome](https://gitlab.gnome.org/GNOME/gnome-shell)
-  GTK Theme: [Adw-gtk3-dark](https://github.com/lassekongo83/adw-gtk3)
-  Shell Theme: Default Gnome
-  Icon Theme: [Numix Circle](https://github.com/numixproject/numix-icon-theme-circle)
-  Wallpaper: [Tate McRae](./src/walls/Tate-McRae.jpg)
-  Terminal: Termite with [onedark color scheme](./src/.config/termite/config) and [Ubuntu Mono font](https://design.ubuntu.com/font/)
-  Editor : [vim](https://github.com/vim/vim)
   with [onedark color scheme](https://github.com/joshdick/onedark.vim)
-  Web Browser: [Firefox](https://www.mozilla.org/en-US/firefox/new/) with [Gnome theme](https://github.com/rafaelmardojai/firefox-gnome-theme)
-  Shell : [Bash](https://www.gnu.org/software/bash/)
-  Launcher: Ulauncher with [Adwaita Darkish](./src/.config/ulauncher/user-themes/ulauncher-adwaita-darkish/)
-  Music: Spotify with [Custom Dribbblish](./src/.config/spicetify/Themes/Dribbblish) [Spicetify](https://github.com/khanhas/spicetify-cli) theme
-  Conky widget: [Now Clocking](https://github.com/AntonVanAssche/now-clocking)

-  Gnome-shell extensions:
   -  [Alpabetical App Grid](https://github.com/stuarthayhurst/alphabetical-grid-extension)
   -  [Bluetooth quick connect](https://github.com/bjarosze/gnome-bluetooth-quick-connect)
   -  [Clipboard Indicator](https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator)
   -  [Gnome 4x UI Improvements](https://github.com/axxapy/gnome-ui-tune)
   -  [Gnoti](https://github.com/AntonVanAssche/gnoti) (Self made)
   -  [GSConnect](https://github.com/GSConnect/gnome-shell-extension-gsconnect)
   -  [Just Perfection](https://gitlab.gnome.org/jrahmatzadeh/just-perfection)
   -  [Sound Input & Output Device Chooser](https://github.com/kgshank/gse-sound-output-device-chooser)
   -  [Workspace Bar](https://github.com/fthx/workspaces-bar)
      -  Customized using dconf Editor: `/org/gnome/desktop/wm/preferences/workspace-names` -> `['www', 'code', 'music', 'virt', 'misc']` a fixed amount of workspaces are required (5).
   -  [Pop-Shell](https://github.com/pop-os/shell)

## Installation

Installation can be done by manually copying the files you want to use. Your best bet, however, is to install via the [`setup.sh`](./setup.sh) script. When using the script, **make sure you fully understand what the script does before you run it**. Also be aware that some data will be **overwritten** automatically with the configurations in this project! So, if you want to keep your data, please make a **backup** of it before running the setup.

In short, the setup process will:

-  Download the dotfiles on your computer.
-  Create some additional [directories](./setup/dotfiles/dirs.sh).
-  [Copy](./setup/dotfiles/dotfiles.sh) the dotfiles.
-  Install the [applications](./setup/packages/) / command-line tools I use.
-  Apply my Gnome-Shell [preferences](./setup/gnome/).
-  Install the [Vim](./setup/packages/devel-tools.sh#L39) plugins I use.

The setup process will not:

-  Install all Gnome-Shell extensions, only [Gnoti](https://github.com/AntonVanAssche/gnoti) and [Pop-Shell](https://github.com/pop-os/shell) will be installed.

### One-liner

For a quick terminal one-liner, using the [`setup.sh`](./setup.sh) script, you should be able to execute the following, assuming you have `wget` installed:

```bash
$ bash -c "$(wget -qO - https://raw.githubusercontent.com/AntonVanAssche/dotfiles/master/setup.sh)"
```

If that fails, you probably don't have `wget`, so try `curl`:

```bash
$ bash -c "$(curl -so - https://raw.githubusercontent.com/AntonVanAssche/dotfiles/master/setup.sh)"
```

If both options fail, you probably have neither `wget` nor `curl`, so try installing one of them and then try running the one-liners again. You can check if you have one of them installed by running `command -v wget` or `command -v curl`, this should return the path where the binary is located.

-  `wget` can be installed with `sudo dnf install wget`.
-  `curl` can be installed with `sudo dnf install curl`.

Once the script is done, simply reboot your system and enable the Gnome-Shell extensions using the extension manager.

```bash
$ sudo system reboot
```

### Cloning the repo:

In case you don't want to use one of the one-liners above, you can just clone the repository and run the [`setup.sh`](./setup.sh) script directly from the directory.

```bash
$ git clone --recursive https://github.com/AntonVanAssche/dotfiles.git
$ cd dotfiles
$ bash setup.sh
```

### Installer preview

![Installer preview](./assets/installer-preview.gif)

## TODO

-  [ ] Install Gnome-Shell extensions
-  [ ] To be continued...
