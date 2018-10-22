export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
export SSH_KEY_PATH="~/.ssh/rsa_id"
export PATH=$HOME/.local/bin:$PATH
export ARCHFLAGS="-arch x86_64"
export BAT_THEME="Dracula"
export UPDATE_ZSH_DAYS=13
export LANG=en_US.UTF-8
export EDITOR='nvim'


ZSH_THEME="trapd00r"
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)


ENABLE_CORRECTION="true"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"


plugins=(
  git
  systemd
  rust
  django
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias grep='grep --color'
alias zshrc='$EDITOR ~/.zshrc'

alias pacs="_ -E pacman -S"
alias pacs-sync="_ -E pacman -Syu"
alias offline="systemctl poweroff"

alias top10='ps -e -o rss,command | awk '"'"'{arr[$2]+=$1}END {for (i in arr) print i"\t"arr[i]/1024"Mb"}'"'"' | sort -k 2 -n -r | head | nl'


