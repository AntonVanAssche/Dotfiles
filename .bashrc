# ~/.bashrc

set -o vi

# Return if shell is not interactive.
[[ $- != *i* ]] && return
[[ -z "${PS1}" ]] && return

shopt -s histappend
shopt -s checkwinsize

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Load files located at .bashrc.d/
if [[ -d "${HOME}/.bashrc.d" ]]; then
     for each in "${HOME}/.bashrc.d/"* ; do
          source "${each}"
     done
fi

# Colored man pages.
if command -v most &> /dev/null; then
     export PAGER="most"
fi

# $PATH
export PATH="${HOME}/.local/bin:${HOME}/bin:${PATH}:${HOME}/.spicetify"

# Case-insensitive completion in Bash
bind -s 'set completion-ignore-case on'

# Clear
bind '"\C-l":clear-screen'

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"
