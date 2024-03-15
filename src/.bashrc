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
export PATH="${HOME}/.local/bin:${PATH}"
export PATH="${PATH}:${HOME}/.spicetify"

# Case-insensitive completion in Bash
bind -s 'set completion-ignore-case on'

# Clear
bind '"\C-l":clear-screen'
