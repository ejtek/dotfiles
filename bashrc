#=====================================================#
#                                                     #
#   ██████╗  █████╗ ███████╗██╗  ██╗██████╗  ██████╗  #
#   ██╔══██╗██╔══██╗██╔════╝██║  ██║██╔══██╗██╔════╝  #
#   ██████╔╝███████║███████╗███████║██████╔╝██║       #
#   ██╔══██╗██╔══██║╚════██║██╔══██║██╔══██╗██║       #
#   ██████╔╝██║  ██║███████║██║  ██║██║  ██║╚██████╗  #
#   ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝  #
#                                                     #
#=====================================================#

# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

### EXPORT
export PATH="$HOME/.local/bin:$PATH"
#export HISTFILE=$HOME/.config/bash/.bash_history
export HISTCONTROL=ignoreboth:erasedups

### SSH Key
#if ! pgrep -u "$USER" ssh-agent > /dev/null; then
#    eval "$(ssh-agent -s)" > /dev/null 2>&1
#fi
#ssh-add ~/.ssh/id_ed25519 &>/dev/null

### ALIAS
if [ -f ~/.alias ]; then
    source ~/.alias
fi

### OPTIONS
bind "set completion-ignore-case on"

### PROMPT
PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null); PS1="[\u@\H \w]${PS1_CMD1:+(${PS1_CMD1})}\\$ "'
