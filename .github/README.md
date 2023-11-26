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
    -   [Ansible](#ansible)
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

### What will be configured

This dotfiles repository automates the configuration of my system using Ansible. The configuration is divided into three custom roles:

#### Base

The "base" role will set up your system with all the essentials for your daily workflow.
This includes installing Alacritty, Neovim, and other necessary packages.
Additionally, it will symlink all dotfiles from this repository to their respective locations.

#### Gnome

The "gnome" role focuses on configuring the Gnome Desktop Environment.
It takes care of the visual aspects, setting the theme and wallpaper, installing Conky and the widget.
Furthermore, it customizes the applications in the dock based on your preferences.

#### Bspwm

The "bspwm" role is designed for configuring the bspwm window manager.
This role is not executed by default; you can switch between Gnome and bspwm by uncommenting/commenting the relevant lines in the `ansible/init.yml` playbook.
The "bspwm" role installs necessary packages like sxhkd and rofi, and it symlinks the configuration files to their appropriate locations.

### Ansible

To initiate the configuration process, ensure you have Ansible installed on your home server, which serves as the control node.
Alternatively, you can also use your `localhost` as the control node.
This can be done by changing the `ansible/inventory.yml` file.
Specify the inventory file when running Ansible commands. For example:

```console
$ ansible-playbook -i ansible/inventory.yml ansible/init.yml --ask-become-pass
```

#### Configuration

Ensure to customize each role by creating host-specific configuration files.
For instance, if your host is called: `fedorable`, create a file named `ansible/host_vars/fedorable.yml` with the necessary configurations.
Use this file as a starting point, and remember to replicate the filename for each host (e.g., `bob.yml` for a host named `bob`).

If you're using the `localhost` as the control node, and want to configure this instance, use `localhost.yml` instead.

## Update

Keep your system up to date by regularly pulling the latest changes from this repository and rerunning the Ansible playbook:

```console
$ git pull origin main
$ ansible-playbook -i ansible/inventory.yml ansible/init.yml --ask-become-pass
```
