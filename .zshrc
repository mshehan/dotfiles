# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

export CPPFLAGS="-I$(xcrun --show-sdk-path)/usr/include"
export LDFLAGS="-L$(xcrun --show-sdk-path)/usr/lib"

export OPENBLAS="$(brew --prefix openblas)"
export CPPFLAGS="-I$(brew --prefix openblas)/include $CPPFLAGS"
export LDFLAGS="-L$(brew --prefix openblas)/lib $LDFLAGS"

export CPPFLAGS="-I$(brew --prefix snappy)/include $CPPFLAGS"
export LDFLAGS="-L$(brew --prefix snappy)/lib $LDFLAGS"

export CPPFLAGS="-I$(brew --prefix bzip2)/include $CPPFLAGS"
export LDFLAGS="-L$(brew --prefix bzip2)/lib $LDFLAGS"

export CPPFLAGS="-I$(brew --prefix libffi)/include $CPPFLAGS"
export LDFLAGS="-L$(brew --prefix libffi)/lib $LDFLAGS"

#adds poetry to PATH variable
export PATH="$PATH:$HOME/.local/bin/"

export PATH="$PATH:/opt/homebrew/Cellar/mongodb-community@4.4/4.4.13/bin"

# initializes pyenv 
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
if which pyenv-virtualenv-init > /dev/null; then
  eval "$(pyenv virtualenv-init -)"
fi

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

eval "$(pyenv init -)"

# vault setup
export VAULT_ADDR="https://vault-cluster-cambly1.private.vault.f705d0e3-6ca4-450e-82b3-0a83f1725cd3.aws.hashicorp.cloud:8200"
export VAULT_NAMESPACE="admin"
# my github personal access token
export VAULT_GITHUB_TOKEN="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"

#adding a function path for my zsh defined functions
fpath=(~/dotfiles/.zsh_functions $fpath);
autoload -U $fpath[1]/*(.:t)

#option to include hidden files
setopt globdots

# Path to your oh-my-zsh installation.
export ZSH="/Users/matthewshehan/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

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

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	zsh-autosuggestions
	web-search
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ls="ls -ACG"
alias startcambly="cd ~/cambly/Cambly-Backend && vaultssh && heroku local -f Procfile.local -e .env-vault-dev"
alias startngrok="ngrok http --subdomain=matthewcambly 8080" 
alias zshedit="tim ~/.zshrc"
alias cleardata="rm -rf ~/Library/Developer/Xcode/DerivedData/"
alias reload="omz reload"
alias booturl="xcrun simctl openurl booted"
alias project_update="sh ~/cambly/Cambly-Swift/project_update.sh"
alias update="sh ~/cambly/Cambly-Swift/update.sh"

# vault aliases
alias vaultssh="pkill -f 'ssh.*vault';ssh -i ~/.aws/hcp-vault-ssh-tunnel-01.pem -f -q -N -L 8200:vault-cluster-cambly1.private.vault.f705d0e3-6ca4-450e-82b3-0a83f1725cd3.aws.hashicorp.cloud:8200 ubuntu@52.87.236.223"
alias psvaultssh="ps aux | grep 'ssh.*vault' | grep -v grep"
alias killvaultssh="pkill -f 'ssh.*vault'"
alias killbe="pkill -9 node; pkill -9 python; pkill -9 ngnix"

eval "$(starship init zsh)"
eval "$(rbenv init -)"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
