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

## Install

To install and configure my systen, I use a self written Ansible role.
This role is designed to setup my system as I like it, but it can be easily customized to suit your needs.

Some of the things this role does:

-   Install the tools I use regularly.
-   Remove unwanted packages.
-   Copy my dotfiles to their designated directory.
-   Install my preferred fonts (Nerd Fonts, Ubuntu Mono and MS Fonts).
-   Configure Gnome to my liking.

To run the playbook, located in the `ansible` directory, you need to have Ansible installed.

```console
$ sudo dnf install ansible
```

Once Ansible is installed, you can run the playbook with the following command:

**NOTE**: This will overwrite any existing configuration files!

```console
$ cd ansible
$ ansible-playbook playbook.yml
```