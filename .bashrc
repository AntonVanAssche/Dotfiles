# ~/.bashrc
[ -z "$PS1" ] && return

HISTCONTROL=ignoreboth
shopt -s histappend
shopt -s checkwinsize

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# .bashrc.d/
if [[ -d "${HOME}/.bashrc.d" ]]; then
        for each in "${HOME}/.bashrc.d/"* ; do
                source "${each}"
        done
fi

# Add applications installed using brew to $PATH.
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

