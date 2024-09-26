<div align="center">
  <h1>Dotfiles: Lunar Rice</h1>
</div>

![Lunar Rice Preview](/.github/assets/Lunar.jpg)

- **OS**: [Fedora Linux](https://getfedora.org/)
- **WM** : [Hyprland](https://hyprland.org/)
- **Bar**: [Waybar](https://github.com/Alexays/Waybar)
- **Launcher**: [Rofi (Wayland)](https://github.com/A417ya/rofi-wayland)
- **Terminal**: [Kitty](https://sw.kovidgoyal.net/kitty/)
- **Shell** : [Bash](https://www.gnu.org/software/bash/)
- **Editor**: [Neovim](https://github.com/neovim/neovim)
- **Font**: [Fira Code](https://github.com/tonsky/FiraCode)
- **Notification Daemon**: [Dunst](https://dunst-project.org/)
- **Color Scheme**: [Catppuccin (Mocha)](https://catppuccin.com/) (Custom background `#11111b`)
  - **GTK Theme**: [Catppuccin GTK](https://github.com/AntonVanAssche/Catppuccin-GTK-Theme) (Fork)
  - **Icon Theme**: [Numix Circle](https://github.com/numixproject/numix-icon-theme-circle)
  - **Mouse Cursor**: [Capitane Cursors](https://www.gnome-look.org/p/1148692/)

## Installation

```console
mkdir -p ~/Projects
git clone git@github.com:AntonVanAssche/Dotfiles.git ~/Projects/Dotfiles
base-bootstrap.sh
hypr-bootstrap.sh
```

## Updating

Since most configuration files are installed by using symbolic links to the
original files, updating the dotfiles is as easy as pulling the latest
changes from this repository.

```console
git pull origin master
```
