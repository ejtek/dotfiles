###########
# ALIASES 
###########

# NAVIGATION
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

# CHANGE "ls" to "lsd"
alias ls="lsd"
alias ll="lsd -l"
alias la="lsd -al"

# CONFIRM INTERACTIVE
alias cp="cp -i"
alias mv="mv -i"
# alias rm="rm -i"

# MAINTNANCE
alias du="du -h"
alias df="df -h"
alias free='free -h'
alias mem5="ps auxf | sort -nr -k 4 | head -5"
alias cpu5="ps auxf | sort -nr -k 3 | head -5"
alias lsmount="mount | column -t"

# OTHER
alias ports='netstat -tulanp'
alias mkdir="mkdir -pv"
alias grep="rg"
alias cat="batcat"
alias ff="firefox"
alias mp="mousepad"
alias cherry="cherrytree"

# UTILS
alias path='echo -e ${PATH//:/\\n}'
alias afk="xdg-screensaver lock"
alias extip="curl icanhazip.com"
alias wtr="curl wttr.in"
alias speedtest="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -"

# COLORS
alias diff='colordiff'
alias dir='dir --color=auto'
alias vdir='vdir --color'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'

## OTHER
alias 'valias'='vim ~/.config/zsh/aliases.zsh'
alias 'vhistory'='vim ~/.zsh_history'
alias 'vzshrc'='vim ~/.zshrc'

# SCRIPTS
alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index
