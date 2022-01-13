
```
  █▀▀▀ ▀█▀ █   █▀▀ █▀▀
  █▀▀   █  █   █▀▀ ▀▀█
▀ ▀    ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀
```

A bunch of files that start with . and makes linux more awesome.

## Info
<img src="./assets/preview.png" alt="img" align="right" width="400px">

- OS: [Fedora Linux](https://getfedora.org/)
- DE : [Gnome](https://gitlab.gnome.org/GNOME/gnome-shell)
- GTK Theme: [Flat Remix GTK](https://github.com/daniruiz/flat-remix-gtk)
- Shell Theme: [Flat Remix Gnome](https://github.com/daniruiz/flat-remix-gnome)
- Icon Theme: [Numix Circle](https://github.com/numixproject/numix-icon-theme-circle)
- Wallpaper: [Barbara Palvin](https://github.com/TuX-sudo/dotfiles/blob/master/wallpapers/barbara-palvin.jpg) (Edited the [original](https://wallpapersden.com/barbara-palvin-photoshoot-for-grazia-italy-2018-wallpaper/) image a little bit to fit the theme)
- Terminal: Termite with [purify color scheme](https://github.com/kyoz/purify/tree/master/termite) and [Ubuntu Mono font](https://design.ubuntu.com/font/)
- Editor : [vim](https://github.com/vim/vim)
 with [purify color scheme](https://github.com/kyoz/purify/tree/master/vim)
- Shell : [Bash](https://www.gnu.org/software/bash/)
- Launcher: Ulauncher with [Flat Remix theme](https://github.com/TuX-sudo/dotfiles/tree/master/.config/ulauncher/user-themes/flat-remix-darkest)
- Music: Spotify with [Custom Dribbblish](https://github.com/TuX-sudo/dotfiles/tree/master/.config/spicetify/Themes/Dribbblish) [Spicetify](https://github.com/khanhas/spicetify-cli) theme
- Conky widget: [Now Clocking](https://github.com/rayzr522/now-clocking)

- Gnome-shell extensions:
  - [Alpabetical App Grid](https://github.com/stuarthayhurst/alphabetical-grid-extension)
  - [Bluetooth quick connect](https://github.com/bjarosze/gnome-bluetooth-quick-connect)
  - [Clipboard Indicator](https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator)
  - [Gnome 4x UI Improvements](https://github.com/axxapy/gnome-ui-tune)
  - [Gnoti](https://github.com/TuX-sudo/gnoti) (Self made)
  - [Hibernate Status Button](https://github.com/arelange/gnome-shell-extension-hibernate-status)
  - [Hide minimized](https://github.com/danigm/hide-minimized)
  - [Hot Edge](https://github.com/jdoda/hotedge)
  - [Just Perfection](https://gitlab.gnome.org/jrahmatzadeh/just-perfection)
  - [Sound Input & Output Device Chooser](https://github.com/kgshank/gse-sound-output-device-chooser)
  - [Workspace Bar](https://github.com/fthx/workspaces-bar) 
    - Customized using dconf Editor: /org/gnome/desktop/wm/preferences/workspace-names -> ['www', 'code', 'music', 'virt', 'misc'] Fixed number of workspaces needed (5)
  - [Pop-Shell](https://github.com/pop-os/shell)
  - Background Logo (Fedora build-in)

## Supported Linux distributions
- Ubuntu
- Fedora
- Gomez OS: [Website](gomezos.tk) [Gitlab](https://gitlab.com/gomez-os)

## Installation

**⚠️ Warning:** **DO NOT** run the `main.sh` script if you do not fully understand what it does. Seriously, **DON'T**!

```bash
$ cd $HOME
$ git clone https://github.com/TuX-sudo/dotfiles.git
$ cd dotfiles/
$ chmod +x setup/main.sh
$ ./setup/main.sh
```
The setup process will:

- Install applications / command-line tools.
- Install the Vim Plugins.
- Set custom system preferences.
- Set custom Gnome preferences.
