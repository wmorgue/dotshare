export ZSH=/home/yung/.oh-my-zsh
ZSH_THEME="kardan"
plugins=(git)

# User configuration
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:home/crime/.gem/ruby/2.3.0/bin"
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
source $ZSH/oh-my-zsh.sh

export EDITOR='nano'

#My alias is pretty sweet ^_^

alias nms="sudo NetworkManager"
alias pacs="sudo pacman -S"
alias pacs-sync="sudo pacman -Syu"
alias offline="systemctl poweroff"


#Ruby and Gem problem
export PATH="$HOME/.rbenv/bin:$PATH"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
