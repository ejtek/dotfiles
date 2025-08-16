#!/usr/bin/env zsh

#=============================================#
#                                             #
#   ███████╗███████╗██╗  ██╗██████╗  ██████╗  # 
#   ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝  # 
#     ███╔╝ ███████╗███████║██████╔╝██║       # 
#    ███╔╝  ╚════██║██╔══██║██╔══██╗██║       # 
#   ███████╗███████║██║  ██║██║  ██║╚██████╗  # 
#   ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝  # 
#                                             # 
#=============================================#

# ~/.zshrc

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


################################
# EXPORT ENVIRONMENT VARIABLES #
################################
export PATH="$HOME/.local/bin:$PATH"
export DOTFILES="$HOME/.dotfiles"
export WORKSPACE="$HOME/workspace"

### XDG
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_RUNTIME_DIR=/run/user/$UID
export XDG_DATA_DIRS=/usr/local/share:/usr/share

### OTHER
export FZF_DEFAULT_COMMAND="fd --type f"

### ZSH
export ZDOTDIR="$HOME/.config/zsh"
export HISTFILE="$HOME/.config/zsh/.histfile"
export HISTFILE="$HOME/.config/zsh/.zsh_history"    # History filepath
export HISTSIZE=10000                       		# Maximum events for internal history
export SAVEHIST=10000                       		# Maximum events in history file

### CUSTOM FUNCTIONS
#FUNCTIONS_DIR="$HOME/.config/zsh/functions"
#for func in "$FUNCTIONS_DIR"/*.zsh; do
#  source "$func"
#done

### SSH
# Check if ssh-agent is running, start it if not
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    eval "$(ssh-agent -s)" >/dev/null 2>&1
fi

# Export necessary SSH environment variables
export SSH_AUTH_SOCK=$(ls /tmp/ssh-*/agent.* 2>/dev/null | head -n 1)
export SSH_AGENT_PID=$(pgrep -u "$USER" ssh-agent)  # Explicitly set the PID

# Add SSH key to the agent
ssh-add ~/.ssh/id_ed25519 &>/dev/null

### PYWAL color scheme
echo -e "$(cat ~/.cache/wal/sequences)"

### MANPAGER
export MANPAGER="less -R --use-color -Dd+r -Du+b"
#export BAT_THEME="dracula"
#eval "$(batman --export-env)"

### ALIAS
[ -f ~/.alias ] && source ~/.alias

### SETOPT
setopt HIST_IGNORE_SPACE               # Don't record commands starting with a space
#setopt HIST_IGNORE_DUPS                # Ignore consecutive duplicates
setopt HIST_IGNORE_ALL_DUPS            # Remove all previous duplicates of a command before saving
#setopt HIST_SAVE_NO_DUPS               # Don't write duplicate entries to the history file
#setopt HIST_EXPIRE_DUPS_FIRST          # Expire duplicate entries first when trimming history
#setopt HIST_FIND_NO_DUPS               # Don't show duplicates when searching history
#setopt HIST_REDUCE_BLANKS              # Remove superfluous blanks before recording
setopt INC_APPEND_HISTORY              # Write to history file immediately, not just on shell exit
#setopt SHARE_HISTORY                   # Share history between all sessions
unsetopt EXTENDED_HISTORY              # For timestamped history

### Compinit && zcompdump
autoload -Uz compinit
compinit -d "$HOME/.config/zsh/.zcompdump"

### FZF
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

### THEMES && PLUGINS
source $HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.config/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source $HOME/.config/zsh/plugins/zsh-autopair/autopair.zsh
source $HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.config/zsh/themes/dracula/dracula-syntax-highlighting
#source $HOME/.config/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh

### Enable case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

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

### POWERLINE 10K
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
source $HOME/.config/zsh/themes/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
