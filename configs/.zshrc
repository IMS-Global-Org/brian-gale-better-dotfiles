

# Appended from .zshrc during environment setup
# Leave the above space empty
set -o vi

export VISUAL=nvim
export EDITOR="$VISUAL"

alias ll='ls -alFoLG'
alias c='clear'
alias clean_branches="git branch | grep -v "dev" | xargs git branch -D"
alias v="nvim"
alias vim="nvim"

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
# export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

cat << "EOF"

                `-:-.   ,-;"`-:-.   ,-;"`-:-.   ,-;"`-:-.   ,-;"
                   `=`,'=/     `=`,'=/     `=`,'=/     `=`,'=/
                     y==/        y==/        y==/        y==/
                   ,=,-<=`.    ,=,-<=`.    ,=,-<=`.    ,=,-<=`.
                ,-'-'   `-=_,-'-'   `-=_,-'-'   `-=_,-'-'   `-=_

-- Not only is the Universe stranger than we think, it is stranger than we can think. --
EOF
