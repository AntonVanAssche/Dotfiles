<div align="center">
   <img src="/assets/dotfiles.png" alt="Banner" width="50%">
   <h5>A bunch of files that start with `.` and makes linux more awesome!</h5>
</div>

The files in this repository are the configuration settings for the tools I use regularly.
They are specifically created to function seamlessly on Fedora Linux, but can be conveniently customized to suit other distributions.

## Table of Contents

-   [Setup Info](#setup-info)
-   [Repository Structure](#repository-structure)
-   [Install](#install)
    -   [One-liner](#one-liner)
    -   [Cloning the repo](#cloning-the-repo)
    -   [Installer preview](#installer-preview)
-   [Update](#update)

## Setup Info

<img src="/assets/TateMcRaePreview.png" alt="preview" align="right" width="400px" style="padding: 30px;">

Here are some details about my setup:

-   **OS**: [Fedora Linux](https://getfedora.org/)
-   **DE** : [Gnome](https://gitlab.gnome.org/GNOME/gnome-shell)
-   **Shell Theme**: Default
-   **GTK Theme**: [Adw-gtk3-dark](https://github.com/lassekongo83/adw-gtk3)
-   **Icon Theme**: [Numix Circle](https://github.com/numixproject/numix-icon-theme-circle)
-   **Wallpaper**: [Tate McRae](/src/walls/Tate-McRae.jpg)
-   **Terminal**: [Alacritty](https://github.com/alacritty)
-   **Editor**: [Neovim](https://github.com/neovim/neovim)
-   **Shell** : [Bash](https://www.gnu.org/software/bash/)
-   **Web Browser**: [Firefox](https://www.mozilla.org/en-US/firefox/new/)
-   **Music**: [Spotify](https://www.spotify.com/)
-   **Conky widget**: [Now Clocking](https://github.com/AntonVanAssche/now-clocking)

-   **Gnome-shell extensions**:
    -   [Alpabetical App Grid](https://github.com/stuarthayhurst/alphabetical-grid-extension)
    -   [Clipboard Indicator](https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator)
    -   [Gnome 4x UI Improvements](https://github.com/axxapy/gnome-ui-tune)
    -   [Just Perfection](https://gitlab.gnome.org/jrahmatzadeh/just-perfection)
    -   [Pop-Shell](https://github.com/pop-os/shell)
    -   [Rounded Window Corners](https://github.com/yilozt/rounded-window-corners)
    -   [Space Bar](https://github.com/christopher-l/space-bar)
        -   Make sure you have a fixed amount of 5 workspaces set.

## Repository Structure

Below is a directory outline that will assist you in locating the configuration or script you wish to duplicate with ease.

```
.
├── assets                                  # Directory containing desktop previews.
├── .github                                 # Directory containing GitHub repository-related files.
├── .gitignore                              # File containing list of files/folders to ignore by Git.
├── .gitmodules                             # File containing list of dependencies.
├── setup
│   ├── dotfiles
│   │   ├── dirs.sh                         # Script to create necessary directories.
│   │   └── dotfiles.sh                     # Script to install dotfiles.
│   ├── fonts
│   │   └── fonts.sh                        # Script to install fonts required by my configurations.
│   ├── gnome
│   │   ├── conky.sh                        # Script to install and configure Conky.
│   │   ├── defaults.sh                     # # Script to configure my Gnome-Shell defaults.
│   │   ├── favorites.sh                    # Script to configure my dash.
│   │   ├── gnoti.sh                        # Script to install Gnoti (a Gnome-Shell extension).
│   │   ├── packages.sh                     # Script to install all dependencies required by my Gnome-Shell configuration.
│   │   ├── privacy.sh                      # Script to make Gnome-Shell more privacy friendly.
│   │   ├── shortcuts.sh                    # Script to configure my keyboard bindings.
│   │   ├── theme.sh                        # Script to set system theme.
│   │   └── wallpaper.sh                    # Script to set wallpaper.
│   └── packages
│       ├── chat.sh                         # Script to install all chat applications I use on a daily basis.
│       ├── develop.sh                      # Script to install the development tools I use.
│       ├── misc.sh                         # Script to install miscellaneous applications.
│       ├── music.sh                        # Script to install music players like Spotify.
│       ├── office.sh                       # Script to install Office tools I use.
│       ├── remove.sh                       # Script to remove unused applications from the default Fedora install.
│       └── torrent.sh                      # Script to install some torrenting tools.
├── setup.sh                                # Main installation script.
└── src
    ├── .bash_profile                       # Bash configuration to load when logging into my system.
    ├── .bashrc                             # Bash configuration to load when opening a new shell.
    ├── .bashrc.d
    │   ├── aliasses                        # Personal Bash aliases.
    │   ├── bash.command-not-found          # Bash script to insult me when I type a command wrong.
    │   ├── functions                       # Personal Bash functions.
    │   └── prompt                          # Personal Bash prompt.
    ├── .config
    │   ├── alacritty                       # Alacritty configurations.
    │   ├── autostart                       # Directory containing applications to start automatically when I log in.
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
    │   └── bin                             # Directory containing scripts/binaries I regularly use.
    ├── sudoers.d                           # Sudo configuration.
    ├── .tmux.conf                          # Tmux configuration.
    └── walls                               # Directory containing wallpapers I enjoy looking at! ;)
```

## Install

You have two options to install the dotfiles: manual copying or using the setup.sh script.
Nonetheless, it is highly recommended that you comprehend the script's functionality before executing it, as some data will be overwritten automatically by the configurations in this project.
So, be sure to backup your data beforehand if you wish to retain it.

In summary, the setup process will:

-   Download the dotfiles to your device.
-   Create additional directories.
-   Copy the dotfiles.
-   Install the applications / command-line tools used by me.
-   Apply my Gnome-Shell preferences.

However, the setup process will **NOT** install all of the Gnome-Shell extensions I use; only Pop-Shell will be installed.

### One-liner

If you need a quick way to install the dotfiles, you can use the one-liner command with the `setup.sh` script.
Make sure you have `wget` installed and execute the following command in your terminal:

```console
$ bash -c "$(wget -qO - https://raw.githubusercontent.com/AntonVanAssche/dotfiles/master/setup.sh)"
```

If `wget` is not installed, try using `curl` instead:

```console
$ bash -c "$(curl -so - https://raw.githubusercontent.com/AntonVanAssche/dotfiles/master/setup.sh)"
```

If both options fail, you need to install either wget or `curl`.
Check if you have one of them installed with `command -v wget` or `command -v curl` and install the missing one with `sudo dnf install wget` or `sudo dnf install curl`.

After the script is finished, reboot your system and activate the Gnome-Shell extensions through the extension manager with this command:

```consle
$ sudo system reboot
```

### Cloning the repo:

Alternatively, you can clone the repository and directly run the `setup.sh` script from the directory.
Execute these commands in your terminal:

```console
$ git clone --recursive https://github.com/AntonVanAssche/dotfiles.git
$ cd dotfiles
$ bash setup.sh
```

The `--recursive` option is needed because the repository contains Git submodules, which are repositories within a repository.
Without the `--recursive` option, the submodules won't be cloned, and some functionalities won't work correctly.
Therefore, including the `--recursive` option ensures that all necessary submodules are cloned along with the main repository.


### Installer preview

**NOTE**: The installer preview may not be completely up-to-date.

![Installer preview](/assets/installer-preview.gif)

## Update

To ensure that all my configurations and scripts are up-to-date with the latest changes, I frequently add new things to the repository.
To automate this process, I created a script called `dot` that simply clones the repository and copies the latest version of the dotfiles to their designated directory.
While it's not particularly fancy (it's almost the same as the `setup.sh` script), it does the job efficiently and effectively.

It's important to note that the dot script will **OVERWRITE** any file that has a location in the `src` directory.
Therefore, if you want to keep your data, it's recommended to make a **BACKUP** of it before running the script.

```
Usage: dot [OPTION]

Options:
-h, --help                  - Display this help and exit.
-d, --download              - Download dotfiles without updating your current configurations.
-u, --update                - Update dotfiles.
```
