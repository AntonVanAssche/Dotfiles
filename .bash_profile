# ~/.bash_profile

[ -f ~/.bashrc ] && source ~/.bashrc

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null; then
	complete -o default -o nospace -F _git g;
fi;

# Make nvim the default editor.
export EDITOR='nvim';
export GIT_EDITOR="${EDITOR}";

# Increase Bash history size. Allow 32³ entries; the default is 500.
export HISTSIZE='500';
export HISTFILESIZE="${HISTSIZE}";

# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth';

# XDG base directory specification.
export XDG_CONFIG_HOME="${HOME}/.config";
export XDG_DATA_HOME="${HOME}/.local/share";
export XDG_STATE_HOME="${HOME}/.local/state";
export XDG_CACHE_HOME="${HOME}/.cache";

export XDG_DESKTOP_DIR="$HOME/Desktop";
export XDG_DOCUMENTS_DIR="$HOME/Documents";
export XDG_DOWNLOAD_DIR="$HOME/Downloads";
export XDG_MUSIC_DIR="$HOME/Music";
export XDG_PICTURES_DIR="$HOME/Pictures";
export XDG_PUBLICSHARE_DIR="$HOME/Public";
export XDG_TEMPLATES_DIR="$HOME/Templates";
export XDG_VIDEOS_DIR="$HOME/Videos";

export LOCATION="";
export VAGRANT_DEFAULT_PROVIDER=virtualbox

if [[ "${XDG_SESSION_TYPE}" == "wayland" ]]; then
    export WAYLAND_DISPLAY="$XDG_SESSION_TYPE-0"
fi
