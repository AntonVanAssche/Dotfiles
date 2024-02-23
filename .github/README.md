<div align="center">
   <img src="/assets/dotfiles.png" alt="Banner" width="50%">
   <h5>A bunch of files that start with `.` and makes linux more awesome!</h5>
</div>

The files in this repository are the configuration settings for the tools I use regularly.
They are specifically created to function seamlessly on Fedora Linux, but can be conveniently customized to suit other distributions.

## Table of Contents

-   [Setup Info](#setup-info)
-   [Installation](#installation)
    -   [Prerequisites](#prerequisites)
    -   [Inventory](#inventory)
    -   [Configuration](#configuration)
    -   [Ansible Vault (Sensitive Vars)](#ansible-vault-(sensitive-vars))
    -   [Usage](#usage)
-   [Updating](#updating)

## Setup Info

<img src="/assets/TateMcRaePreview.png" alt="preview" align="right" width="400px" style="padding: 30px;">

Here are some details about my setup:

-   **OS**: [Fedora Linux](https://getfedora.org/)
-   **DE** : [Gnome](https://gitlab.gnome.org/GNOME/gnome-shell)
-   **Shell Theme**: Default
-   **GTK Theme**: [Adw-gtk3-dark](https://github.com/lassekongo83/adw-gtk3)
-   **Icon Theme**: [Numix Circle](https://github.com/numixproject/numix-icon-theme-circle)
-   **Wallpaper**: [Tate McRae](/src/walls/Tate-McRae-1.jpg)
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

## Installation

### Prerequisites

Ensure that you have Ansible installed on a server/desktop, which serves as the control node.
This may also be `localhost`, but I prefer to use a separate server/desktop to manage my dotfiles.

```console
$ sudo dnf install ansible
```

Once Ansible is installed, it's time to install all roles this playbook relies on.

```console
$ ansible-galaxy install -r ansible/requirements.yml
```

### Inventory

Create an inventory file (e.g. `ansible/inventory.yml`) with the following contents:

```yml
servers:
  vars:
    ansible_user: <username>
    ansible_become: true
  hosts:
    fedorable:
      ansible_host: <ip_address>
      ansible_ssh_private_key_file: "{{ ansible_env.HOME }}/.ssh/<ssh_private_key>/"
```

### Configuration

Ensure to customize each role by creating host-specific configuration files.
Use `ansible/host_vars/fedorable.yml` as a starting point, and replicate the filename for each host (e.g., `bob.yml` for a host named `bob`).

When configuring `local` hosts, ensure the configuration file is called `localhost.yml`.

Currently, the following custom roles used:

-   **Base:** This role installs a bunch of packages and configures some basic settings, and installs a bunch of packages.
-   **Gnome:** This role installs and configures the desktop experience, by applying themes, conky widgets, and more.
-   **(WIP) Bspwm:** THis role is disabled by default, simply uncomment it within the `init.yml` playbook. Ths role installs all required packages, installs the configuration files, and more.

### Ansible Vault (Sensitive Vars)

Create an Ansible vault to securely store the `ansible_become_pass` variable.

```console
$ ansible-vault create ansible/vaulted_vars.yml
```

Add sensitive information to the vault, and save the file.

```yml
ansible_become_pass: "<password>"
```

### Usage

Run the Ansible playbook to apply the configurations:

```console
$ ansible-playbook -i ansible/inventory.yml ansible/init.yml --ask-vault-pass
```

## Updating

Since most configuration files are installed by using symbolic links to the original files, updating the dotfiles is as easy as pulling the latest changes from this repository.

```console
$ git pull origin master
```
However, some configuration files are not installed by using symbolic links, but by rerunning the Ansible playbook theses files will be updated as well.

```console
$ git pull origin master
```
