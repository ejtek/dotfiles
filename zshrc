#!/usr/bin/env zsh

###############################
# EXPORT ENVIRONMENT VARIABLE #
###############################

export DOTFILES="$HOME/.dotfiles"
export WORKSPACE="$HOME/workspace"

## ERRFILE
ERRFILE="$XDG_CACHE_HOME/X11/.xsession-errors"
ERRFILE="$XDG_CACHE_HOME/X11/.xsession-errors.old"

## XDG
#export XDG_CONFIG_HOME=$HOME/.config
#export XDG_CACHE_HOME=$$HOME/.cache
#export XDG_DATA_HOME=$HOME/.local/share
#export XDG_STATE_HOME=$HOME/.local/state
#export XDG_RUNTIME_DIR=/run/user/$UID
#export XDG_DATA_DIRS=/usr/local/share:/usr/share
#export XDG_CONFIG_DIRS=/etc/xdg

## ZSH
export ZDOTDIR="$HOME/.config/zsh"
export HISTFILE="$HOME/.config/zsh/.histfile"
export HISTFILE="$HOME/.config/zsh/.zsh_history"    # History filepath
export HISTSIZE=10000		# Maximum events for internal history
export SAVEHIST=10000		# Maximum events in history file

## MAN Page
#export MANPAGER='vim +Man!'

## SOURCES
[ -f ~/.alias ] && source ~/.alias
source $HOME/.config/zsh/plugins/.zsh-history-substring-search/zsh-history-substring-search.zsh

# Set custom zcompdump location for compinit
autoload -Uz compinit
compinit -d "$HOME/.config/zsh/.zcompdump"

# Enable case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

## SETOPT
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE

## KEYBINDS
# Home and End keys (common codes)
bindkey '^[[H' beginning-of-line   # Home
bindkey '^[[F' end-of-line         # End

# Home and End keys (alternate codes)
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line

# Ctrl+A and Ctrl+E (should work by default, but can be set explicitly)
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

# Ctrl+Left/Right Arrow for word movement (may need these for some terminals)
bindkey '^[OD' backward-word
bindkey '^[OC' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# Backspace delete
bindkey '^[[3~' delete-char

# Page Up/Page Down
bindkey '\e[5~' up-line-or-history
bindkey '\e[6~' down-line-or-history

# Substring search with arrow keys
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

## PROMPT
autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST
PROMPT='%F{green}%*%f %F{magenta}%~%f %F{#ffff00}${vcs_info_msg_0_}%f$ '

### SSH
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    eval "$(ssh-agent -s)"
fi
ssh-add ~/.ssh/id_rsa &>/dev/null

## Disable screenblank
xset s off && xset -dpms && xset s noblank

## 
