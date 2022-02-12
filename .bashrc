# ~/.bashrc
[ -z "$PS1" ] && return

shopt -s histappend
shopt -s checkwinsize

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# .bashrc.d/
if [[ -d "${HOME}/.bashrc.d" ]]; then
   for each in "${HOME}/.bashrc.d/"* ; do
      source "${each}"
   done
fi

# $PATH
export PATH="$HOME/.local/bin:$PATH"
