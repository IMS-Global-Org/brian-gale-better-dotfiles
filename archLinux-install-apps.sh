#!/usr/bin/bash
# Installs any applications using pacman that are required for the working env
function checkAndInstallPackage {
  RESULT=`pacman -Qs --color always $1 | grep "local" | grep $1`

  if [[ $RESULT == "" ]]; then
    echo "[install-apps] Installing $1..."
    pacman -S $1
  else
    echo "[install-apps] $1 is already installed..."
  fi
}

# Installs any Gems that are required for the working environment
function checkAndInstallGem {
  RESULT=`gem list -i $1`

  if [[ $RESULT == "true" ]]; then
    echo "[install-gems] Gem $1 installed"
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

echo -n "Install all base packages for Manjaro (Y/n)?"; read answer
if [[ $answer == "y" ]] || [[ $answer == "Y" ]] ; then
  echo "[install-manajaro-base] Checking for 'pacman'..."

  APT=`which pacman`
  if [[ $APT == "" ]]; then
    echo "[installing] Warning! Must have 'pacman' installed to load applications."
    exit 1;
  else
    echo "[installing] pacman installed"
  fi

  pacman -Syy
  pacman -Syu

  checkAndInstallPackage "zsh"
  checkAndInstallPackage "neovim"
  checkAndInstallPackage "tmux"
  checkAndInstallPackage "git"
  checkAndInstallPackage "redis"
  checkAndInstallPackage "libnotify"
  checkAndInstallPackage "mdp"
  checkAndInstallPackage "fzf"
  checkAndInstallPackage "the_silver_searcher"
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
    exit 1;
  fi

  echo "[install-apps] checking oh-my-zsh zsh-autosuggestions"
  GIT=`which git`
  if [[ $GIT != "" ]]; then
    echo "[install-apps] loading oh-my-zsh zsh-autosuggestions"
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  else
    echo "oh-my-zsh history substring search not installed"
    exit 1;
  fi

  echo "[install-apps] Checking RVM..."

  RVM=`which rvm`
  if [[ $RVM == "" ]]; then
    echo "[install-apps] Installing RVM..."
    gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
    curl -sSL https://get.rvm.io | bash -s stable --ruby
    sudo pacman -S rubygems
    echo 'source "/etc/profile.d/rvm.sh"' >> ./configs/.zshrc
  else
    echo "[install-apps] RVM already installed"
  fi

  echo "[install-apps] Setting up additional packages..."

  #checkAndInstallGem "colorls"
  checkAndInstallGem "tmuxinator"
  checkAndInstallNpm "gtop"
fi

