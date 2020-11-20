#!/usr/bin/bash
# Installs any applications using apt-get that are required for the working env
function checkAndInstallPackage {
  RESULT=`apt-get list $1`

  if [[ $RESULT == "" ]]; then
    echo "[install-apps] Installing $1..."
    apt-get install $1
  else
    echo "[install-apps] $1 is already installed..."
  fi
}

# Installs any Gems that are required for the working environment
function checkAndInstallGem {
  RESULT=`gem list -i $1`

  if [[ $RESULT == "true" ]]; then
    echo "[install-gems] Gem installed $1"
  else
    echo "[install-gems] Installing gem $1..."
    gem install $1
  fi
}

# Installs required npm or yarn packages
function checkAndInstallNpm {
  RESULT=`npm list -g $1`

  if [[ $RESULT == *"empty"* ]]; then
    echo "[install-npm] Installing npm $1..."
    npm install $1 -g
  else
    echo "[install-npm] NPM installed $1"
  fi
}

echo -n "Install all base packages for Ubuntu (Y/n)?"; read answer
if [[ $answer == "y" ]] || [[ $answer == "Y" ]] ; then
  echo "[install-ubuntu-base] Checking for 'apt-get'..."

  APT=`which apt`
  if [[ $APT == "" ]]; then
    echo "[installing] Warning! Must have 'apt' installed to load applications."
    exit 1;
  else
    echo "[installing] APT-GET installed"
  fi

  apt update
  apt-get update

  checkAndInstallPackage "zsh"
  checkAndInstallPackage "neovim"
  checkAndInstallPackage "tmux"
  checkAndInstallPackage "git"
  checkAndInstallPackage "redis"
  checkAndInstallPackage "terminal-notifier"
  checkAndInstallPackage "mdp"
  checkAndInstallPackage "fzf"
  checkAndInstallPackage "silversearcher-ag"
  checkAndInstallPackage "ripgrep"
  checkAndInstallPackage "npm"
  checkAndInstallPackage "cmatrix"
  checkAndInstallPackage "tig"

  echo "[install-apps] Installing oh-my-zsh"
  SH=`which sh`
  if [[ $SH != "" ]]; then
    echo "[install-apps] loading oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  else
    echo "[install-apps] oh-my-zsh installation failed"
  fi

  echo "[install-apps] checking oh-my-zsh zsh-autosuggestions"
  GIT=`which git`
  if [[ $GIT != "" ]]; then
    echo "[install-apps] loading oh-my-zsh zsh-autosuggestions"
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  else
    echo "oh-my-zsh history substring search not installed"
  fi

  echo "[install-apps] Checking RVM..."

  RVM=`which rvm`
  if [[ $RVM == "" ]]; then
    echo "[install-apps] Installing RVM..."
    sudo apt-get install software-properties-common
    sudo apt-add-repository -y ppa:rael-gc/rvm
    sudo apt-get update
    sudo apt-get install rvm
    echo 'source "/etc/profile.d/rvm.sh"' >> ./configs/.zshrc
  else
    echo "[install-apps] RVM already installed"
  fi

  echo "[install-apps] Setting up additional packages..."

  #checkAndInstallGem "colorls"
  checkAndInstallGem "tmuxinator"
  checkAndInstallNpm "gtop"
fi

