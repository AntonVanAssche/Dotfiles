<div align="center">
   <img src="/assets/dotfiles.png" alt="Banner" width="50%">
   <h5>A bunch of files that start with `.` and makes linux more awesome!</h5>
</div>

This repository contains the configuration files for the tools I use day-to-day.

These configurations are designed to work out-of-the-box on Fedora Linux, but can be easily adapted to other distributions.

## Table of Contents

-  [Setup Info](#setup-info)
-  [Repository Structure](#repository-structure)
-  [Installation](#installation)
   -  [One-liner](#one-liner)
   -  [Cloning the repo](#cloning-the-repo)
   -  [Installer preview](#installer-preview)
-  [Update](#update)
-  [TODO](#todo)

## Setup Info

<img src="/assets/TateMcRaePreview.png" alt="preview" align="right" width="400px" style="padding: 30px;">

Here are some details about my setup:

-  **OS**: [Fedora Linux](https://getfedora.org/)
-  **DE** : [Gnome](https://gitlab.gnome.org/GNOME/gnome-shell)
-  **Shell Theme**: Default
-  **GTK Theme**: [Adw-gtk3-dark](https://github.com/lassekongo83/adw-gtk3)
-  **Icon Theme**: [Numix Circle](https://github.com/numixproject/numix-icon-theme-circle)
-  **Wallpaper**: [Tate McRae](./src/walls/Tate-McRae.jpg)
-  **Terminal**: [Alacritty](https://github.com/alacritty)
-  **Editor**: [Neovim](https://github.com/neovim/neovim)
-  **Shell** : [Bash](https://www.gnu.org/software/bash/)
-  **Web Browser**: [Firefox](https://www.mozilla.org/en-US/firefox/new/)
-  **Launcher**: [Rofi](https://github.com/davatorium/rofi)
-  **Music**: [Spotify](https://www.spotify.com/)
-  **Conky widget**: [Now Clocking](https://github.com/AntonVanAssche/now-clocking)

-  **Gnome-shell extensions**:
   -  [Alpabetical App Grid](https://github.com/stuarthayhurst/alphabetical-grid-extension)
   -  [Bluetooth quick connect](https://github.com/bjarosze/gnome-bluetooth-quick-connect)
   -  [Clipboard Indicator](https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator)
   -  [Gnome 4x UI Improvements](https://github.com/axxapy/gnome-ui-tune)
   -  [Gnoti](https://github.com/AntonVanAssche/gnoti)
   -  [GSConnect](https://github.com/GSConnect/gnome-shell-extension-gsconnect)
   -  [Just Perfection](https://gitlab.gnome.org/jrahmatzadeh/just-perfection)
   -  [Sound Input & Output Device Chooser](https://github.com/kgshank/gse-sound-output-device-chooser)
   -  [Workspace Bar](https://github.com/fthx/workspaces-bar)
      -  **Using dconf Editor**: navigate to `/org/gnome/desktop/wm/preferences/workspace-names` and change the custom value to `['www', 'code', 'music', 'virt', 'misc']`.
      -  Make sure you have a fixed amount (5) of workspaces set.
   -  [Pop-Shell](https://github.com/pop-os/shell)
   -  [Rounded Window Corners](https://github.com/yilozt/rounded-window-corners)

## Repository Structure

Her you'll find a list of the repository structure, so you can easily access a configuration/script you want to copy.

```
.
├── assets                                  # Previews.
├── .github                                 # GitHub Repository stuff.
├── .gitignore                              # Files to ignore by GIT.
├── .gitmodules                             # List of dependencies.
├── setup
│   ├── dotfiles
│   │   ├── dirs.sh                         # Create all directories I need.
│   │   └── dotfiles.sh                     # Install all dotfiles.
│   ├── fonts
│   │   └── fonts.sh                        # Install all fonts my configurations need.
│   ├── gnome
│   │   ├── conky.sh                        # Install and configure Conky.
│   │   ├── defaults.sh                     # Configure my Gnome-Shell defaults.
│   │   ├── favorites.sh                    # Configure my dash.
│   │   ├── gnoti.sh                        # Install Gnoti (a Gnome-Shell extension).
│   │   ├── packages.sh                     # Install all dependencies my Gnome-Shell configuration needs.
│   │   ├── privacy.sh                      # Make Gnome-Shell a bit more privacy friendly.
│   │   ├── shortcuts.sh                    # Configure my keyboardbindings.
│   │   ├── theme.sh                        # Set system theme.
│   │   └── wallpaper.sh                    # Set the wallpaper.
│   └── packages
│       ├── chat.sh                         # Install all chat applications I use on a daily basis.
│       ├── develop.sh                      # Install the development tools I use.
│       ├── misc.sh                         # Install miscellaneous applications.
│       ├── music.sh                        # Install music players like Spotify and Lollypop.
│       ├── office.sh                       # Install Office tools I use.
│       ├── remove.sh                       # Remove unused applications from the default Fedora install.
│       └── torrent.sh                      # Install some torrenting tools.
├── setup.sh                                # Main installation script.
└── src
    ├── .bash_profile                       # Bash configuration to load when logging into my system.
    ├── .bashrc                             # Bash configuration to load when opening a new SHELL.
    ├── .bashrc.d
    │   ├── aliasses                        # Personal Bash Aliasses.
    │   ├── bash.command-not-found          # Bash script to insult me when I typed a command wrong.
    │   ├── functions                       # Personal Bash functions.
    │   └── prompt                          # Personal Bash prompt.
    ├── .config
    │   ├── alacritty                       # Alacritty configuration.
    │   ├── autostart                       # Applications to start automatically when I log in.
    │   ├── bat                             # Bat configuration.
    │   ├── conky                           # Conky configuration.
    │   ├── htop                            # htop configuration.
    │   ├── nvim                            # Neovim configuration.
    │   ├── rofi                            # Rofi configuration.
    │   ├── spicetify                       # Spicetify configuration to customize Spotify client.
    │   ├── tmux                            # Tmux plugins.
    │   └── wget                            # Wget configuration.
    ├── dnf                                 # DNF configuration mainly to speed up DNF.
    ├── .gitconfig                          # Personal Git configuration.
    ├── .local
    │   └── bin                             # Scripts/binaries I regularly use.
    ├── sudoers.d                           # Sudo configuration.
    ├── .tmux.conf                          # Tmux configuration.
    └── walls                               # Wallpapers.
```

## Installation

Installation can be done by manually copying the files you want to use. Your best bet, however, is to install via the [`setup.sh`](./setup.sh) script. When using the script, **make sure you fully understand what the script does before you run it**. Also be aware that some data will be **overwritten** automatically with the configurations in this project! So, if you want to keep your data, please make a **backup** of it before running the setup.

In short, the setup process will:

-  Download the dotfiles on your computer.
-  Create some additional [directories](/setup/dotfiles/dirs.sh).
-  [Copy](/setup/dotfiles/dotfiles.sh) the dotfiles.
-  Install the [applications](/setup/packages/) / command-line tools I use.
-  Apply my Gnome-Shell [preferences](/setup/gnome/).
-  Install the [Neovim](/setup/packages/devel-tools.sh#L48) plugins I use.

The setup process will not:

-  Install all Gnome-Shell extensions I use, only [Gnoti](https://github.com/AntonVanAssche/gnoti) and [Pop-Shell](https://github.com/pop-os/shell) will be installed.

### One-liner

For a quick terminal one-liner, using the [`setup.sh`](/setup.sh) script, you should be able to execute the following, assuming you have `wget` installed:

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

In case you don't want to use one of the one-liners above, you can just clone the repository and run the [`setup.sh`](/setup.sh) script directly from the directory.

```bash
$ git clone --recursive https://github.com/AntonVanAssche/dotfiles.git
$ cd dotfiles
$ bash setup.sh
```

### Installer preview

**NOTE**: The installer preview may not be completely up to date.

![Installer preview](/assets/installer-preview.gif)

## Update

Because I add new things quite often, there is a script script [`dot`](/src/.local/bin/dot) that I have written to automate the process of updating all the configurations/scripts to there latest version.

The [`dot`](/src/.local/bin/dot) script simply clones the repository and copies the latest version of the dotfiles to there designated directory. It's nothing special (almost the same as the [`setup.sh`](/setup.sh) script) but it gets the job done which is all I need.

**NOTE**: the [`dot`](/src/.local/bin/dot) script will overwrite any file that has a location in the `src` directory. So, if you want to keep your data, please make a **backup** of it before running the script.

```
Usage: dot [OPTION]

Options:
-h, --help                  - Display this help and exit.
-d, --download              - Download dotfiles without updating your current configurations.
-u, --update                - Update dotfiles.
```

## TODO

-  [ ] Automatically install all Gnome-Shell extensions
-  [ ] To be continued...
