[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Allow for a local bashrc to be loaded if there is one
if [ -f ~/.bashrc.local ]; then
  . ~/.bashrc.local
fi

# Load bashrc
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# rbenv variables
export PATH=/Users/brennicklangston/.rbenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/brennicklangston/.fzf/bin
eval export PATH="/Users/brennicklangston/.rbenv/shims:${PATH}"
export RBENV_SHELL=bash
source '/usr/local/Cellar/rbenv/1.1.2/libexec/../completions/rbenv.bash'
command rbenv rehash 2>/dev/null
rbenv() {
  local command
  command="${1:-}"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval "$(rbenv "sh-$command" "$@")";;
  *)
    command rbenv "$command" "$@";;
  esac
}

# do multi threaded rspec tests, or in parallel
alias rspecp="bundle && bin/rails db:environment:set RAILS_ENV=test && RAILS_ENV=test rails parallel:drop parallel:create parallel:migrate parallel:spec"

# settings for rbenv
export PATH=/Users/brennicklangston/.rbenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
eval export PATH="/Users/brennicklangston/.rbenv/shims:${PATH}"
export RBENV_SHELL=zsh
source '/usr/local/Cellar/rbenv/1.1.2/libexec/../completions/rbenv.zsh'
command rbenv rehash 2>/dev/null
rbenv() {
  local command
  command="${1:-}"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval "$(rbenv "sh-$command" "$@")";;
  *)
    command rbenv "$command" "$@";;
  esac
}
