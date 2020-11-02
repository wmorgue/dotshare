# export HOMEBREW_NO_AUTO_UPDATE=1
export PATH=$HOME/bin:/usr/local/bin:$PATH
export TOOLCHAINS=swift
export PATH=/usr/local/opt/openssl/bin:$PATH

export RANGER_LOAD_DEFAULT_RC="FALSE"
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
export ZSH=$HOME/.oh-my-zsh
export UPDATE_ZSH_DAYS=14
export EDITOR=$(which nvim)

# Rust/Cargo completions
fpath+=~/.zfunc

#ZSH_THEME="random"

# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true
# DISABLE_AUTO_TITLE="true"

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
swift=$HOME/Developer/Swift
rust=$HOME/Developer/Rust
work=$HOME/Developer/Work
# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
    swiftpm
)

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

alias ls='lsd'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias purge='sudo purge'
alias grep='grep --color'
alias htop='htop -d 0'
alias zshrc='$EDITOR ~/.zshrc'
alias bump='brew upgrade; brew upgrade --cask; brew cleanup'
alias swift-lint='swift-format -m lint -r'
alias xcode='open -a /Applications/Xcode.app'
alias hwinfo='system_profiler SPHardwareDataType'
alias cpu_name='sysctl -n machdep.cpu.brand_string'


eval "$(starship init zsh)"
