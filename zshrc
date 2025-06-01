#!/usr/bin/env zsh

#echo "                                              "
#echo "                                              "
#echo "  ## ##   ###  ##   ## ##    ## ##   #### ##  "
#echo " ##   ##   ##  ##  ##   ##  ##   ##  # ## ##  "
#echo " ##        ##  ##  ##   ##  ####       ##     "
#echo " ##  ###   ## ###  ##   ##   #####     ##     "
#echo " ##   ##   ##  ##  ##   ##      ###    ##     "
#echo " ##   ##   ##  ##  ##   ##  ##   ##    ##     "
#echo "  ## ##   ###  ##   ## ##    ## ##    ####    "
#echo "                                              "                 
#echo "                                              "

###############################
# EXPORT ENVIRONMENT VARIABLE #
###############################

### XDG
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_RUNTIME_DIR=/run/user/$UID
export XDG_DATA_DIRS=/usr/local/share:/usr/share

### PATH
export PATH="$HOME/.local/bin:$PATH"
export DOTFILES="$HOME/.dotfiles"
export WORKSPACE="$HOME/workspace"

### ERRFILE
#ERRFILE="$XDG_CACHE_HOME/X11/.xsession-errors"
#ERRFILE="$XDG_CACHE_HOME/X11/.xsession-errors.old"

### ZSH
export ZDOTDIR="$HOME/.config/zsh"
export HISTFILE="$HOME/.config/zsh/.histfile"
export HISTFILE="$HOME/.config/zsh/.zsh_history"    # History filepath
export HISTSIZE=10000		# Maximum events for internal history
export SAVEHIST=10000		# Maximum events in history file

### ALIAS
[ -f ~/.alias ] && source ~/.alias

### PLUGINS
source $HOME/.config/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source $HOME/.config/zsh/plugins/zsh-autopair/autopair.zsh
source $HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

### THEMES
# Powerline 10K
source $HOME/.config/zsh/themes/powerlevel10k/powerlevel10k.zsh-theme
source $HOME/.config/zsh/.p10k.zsh

### LS_COLORS <https://geoff.greer.fm/lscolors/>
#LS_COLORS=$LS_COLORS:'di=1;34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43:' ; export LS_COLORS

### Custom zcompdump location for compinit
autoload -Uz compinit
compinit -d "$HOME/.config/zsh/.zcompdump"

### Enable case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

### SETOPT
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE

### KEYBINDS
# Home and End keys
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

# Ctrl+Left and Right Arrow for word movement
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# Page Up and Page Down
bindkey '\e[5~' up-line-or-history
bindkey '\e[6~' down-line-or-history

# Backspace delete
bindkey '^[[3~' delete-char

# Substring search with arrow keys
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Ctrl+A and Ctrl+E
#bindkey '^A' beginning-of-line
#bindkey '^E' end-of-line

### PROMPT
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

### Disable screenblank
xset s off && xset -dpms && xset s noblank

### archive extraction
# usage: ex <file>
ex ()
{
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
