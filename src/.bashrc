# ~/.bashrc

set -o vi

[ -z "$PS1" ] && return

shopt -s histappend
shopt -s checkwinsize

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Load files located at .bashrc.d/
if [[ -d "${HOME}/.bashrc.d" ]]; then
   for each in "${HOME}/.bashrc.d/"* ; do
      source "${each}"
   done
fi

# Show current time.
source "${HOME}/.local/bin/current-time"

# Load pywal.
# source "${HOME}/.local/bin/load-pywal"

# Colored man pages.
if command -v most &> /dev/null; then
   export PAGER="most"
fi

# $PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/.spicetify"
