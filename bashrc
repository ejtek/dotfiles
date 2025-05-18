#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '


### SSH
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    eval "$(ssh-agent -s)"
fi
ssh-add ~/.ssh/id_rsa &>/dev/null


### EXPORT
export HISTCONTROL=ignoreboth
###export HISTCONTROL=erasedups


### OPTIONS
bind "set completion-ignore-case on"


### ALIAS
if [ -f ~/.alias ]; then
    source ~/.alias
fi
