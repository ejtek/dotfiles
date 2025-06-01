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
export PATH="$HOME/.local/bin:$PATH"
#export HISTFILE=$HOME/.config/bash/.bash_history
export HISTCONTROL=ignoreboth
#export HISTCONTROL=erasedups


### OPTIONS
bind "set completion-ignore-case on"


### ALIAS
if [ -f ~/.alias ]; then
    source ~/.alias
fi

### PROMPT
PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'; PS1='[\u@\H \w](${PS1_CMD1})\\$ '
