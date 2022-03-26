# If you come from bash you might have to change your $PATH.
 export PATH=$HOME/.asdf/shims:$HOME/bin:/usr/local/bin:$HOME/SiftScience/repos/devops-tools/bash/bin:$PATH
 export PATH=$HOME/go/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/blangston/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
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
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git yarn asdf ruby node golang zsh-autosuggestions)

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


# Appended from .bashrc during environment setup
# Leave the above space empty
set -o vi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag --ignore --hidden --ignore-dir vendor --ignore-dir node-modules -g "" '
export FZF_DEFAULT_OPTS='
--color fg:252,bg:234,hl:67,fg+:84,bg+:234,hl+:67
--color info:144,prompt:161,spinner:135,pointer:84,marker:118
'

export VISUAL=nvim
export EDITOR="$VISUAL"

alias ll='ls -alFoLG'
alias c='clear'
alias clean_branches="git branch | grep -v "dev" | xargs git branch -D"
alias v="nvim"
alias vim="nvim"
alias tmx="tmuxinator"

GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS="yes"
GIT_PS1_SHOWDIRTYSTATE="yes"
GIT_PS1_SHOWUNTRACKEDFILES="yes"

source ~/.git-prompt.sh
# source ~/.git-completion.sh

magenta=$(tput setaf 5)
blue=$(tput setaf 4) 
reset=$(tput sgr0)

#export PROMPT_COMMAND='__git_ps1 "\u@\h:\W" "\\\$ ";'
export PROMPT_COMMAND='__git_ps1 "\[$reset\][\[$blue\]\W\[$reset\]]" " ~ ";'

# Helper functions for Sift/Chargeback work environment
alias ecs='ecs-session search'
alias ecc='ecs-session connect'
alias dc='docker-compose'
alias du='docker-compose up'
alias dr='docker-compose run --rm web '
alias drb='docker-compose run --rm web bash'
alias ds='docker-compose run --service-ports --rm web bash'

alias tmx='tmuxinator'

function docker_helpers() {
  echo 'Docker Compose Helpers'
  echo 'dc - docker-compose'
  echo 'du - docker-compose up'
  echo 'dr - docker-compose run --rm web'
  echo 'drb - docker-compose run --rm web  bash'
  echo 'ds - docker-compose run --service-ports --rm web bash'
}

function ecr_docker_login() {
  aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 538795852638.dkr.ecr.us-west-2.amazonaws.com
}

function start_ddt {
  REPO_DIR=`pwd`
  cd ~/SiftScience/repos/docker-dev-tools
  clear
  du redis rabbit postgres
  cd $REPO_DIR
}

function stop_ddt {
  REPO_DIR=`pwd`
  cd ~/SiftScience/repos/docker-dev-tools
  dc down
  clear
  cd $REPO_DIR
}
