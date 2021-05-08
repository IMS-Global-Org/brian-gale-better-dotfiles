#!/usr/bin/bash
# Copy over configuration files for working environment
echo -n "Link dotfiles and install packages (Y/n)?"; read answer
if [[ $answer != "n" ]] && [[ $answer != "N" ]] ; then

  # Copy old orig config files as backups 
  echo "[archLinux_setup.sh] Copying old original files as backups"
	cp -iv "$HOME/.tmux.conf" "$HOME/.tmux.orig.conf"
	cp -iv "$HOME/.git-completion.sh" "$HOME/.git-completion.orig.sh"
	cp -iv "$HOME/.git-prompt.sh" "$HOME/.git-prompt.orig.sh"
	cp -iv "$HOME/.config/nvim/init.vim" "$HOME/.config/nvim/init.orig.vim"
	cp -iv "$HOME/.gitconfig" "$HOME/.gitconfig_orig"
	cp -iv "$HOME/.bashrc" "$HOME/.bashrc_orig"
	cp -iv "$HOME/.zshrc" "$HOME/.zshrc_orig"
	cp -iv "$HOME/.bash_profile" "$HOME/.bash_profile_orig"
	cp -iv "$HOME/.fzf-tmux.sh" "$HOME/.fzf-tmux.orig.sh"
	cp -iv "$HOME/.bin/tmuxinator.bash" "$HOME/.bin/tmuxinator.orig.bash"

  # Remove old symlinks
  echo "[linux_setup.sh] Remove old symlinks..."
	rm -f "$HOME/.tmux.conf"
	rm -f "$HOME/.git-completion.sh"
	rm -f "$HOME/.git-prompt.sh"
	rm -f "$HOME/.config/nvim/init.vim"
	rm -f "$HOME/.gitconfig"
	rm -f "$HOME/.bashrc"
	rm -f "$HOME/.zshrc"
	rm -f "$HOME/.bash_profile"
	rm -f "$HOME/.fzf-tmux.sh"
	rm -f "$HOME/.bin/tmuxinator.bash"

  ## Add new symlinks
  echo "[linux_setup.sh] Symlinking config files..."
	ln -s "$PWD/configs/.tmux.conf" "$HOME/.tmux.conf"
	ln -s "$PWD/configs/.git-completion.sh" "$HOME/.git-completion.sh"
	ln -s "$PWD/configs/.git-prompt.sh" "$HOME/.git-prompt.sh"
	ln -s "$PWD/configs/.gitconfig" "$HOME/.gitconfig"
	ln -s "$PWD/configs/.bash_profile" "$HOME/.bash_profile"
	ln -s "$PWD/configs/.bashrc" "$HOME/.bashrc"
	ln -s "$PWD/configs/.zshrc" "$HOME/.zshrc"
	ln -s "$PWD/configs/.vimrc" "$HOME/.vimrc"
	ln -s "$PWD/scripts/.fzf-tmux.sh" "$HOME/.fzf-tmux.sh"

  ## Tuxinator Bash File
  mkdir -vp ~/.bin
  ln -s "$PWD/scripts/tmuxinator.bash" "$HOME/.bin/tmuxinator.bash"

  ## FZF
  echo "[linux_setup.sh] Installing fzf..."
    sudo pacman -S fzf

  ## NVim & Install vim plugins
  echo "[linux_setup.sh] Setting up nvim packages..."
	  mkdir -p ~/.config/nvim 
	  ln -s "$PWD/configs/init.vim" "$HOME/.config/nvim/init.vim"
	  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	  nvim +silent +PlugInstall +qall

  #####################
  ## Powerline fonts ##
  #####################
  # https://github.com/powerline/fonts
  # Use system release fonts
  echo "[linux_setup.sh] Installing powerline fonts..."
  sudo pacman -S powerline
  sudo pacman -S powerline-fonts

  # Tmux plugins
  echo "[linux_setup.sh] Setting up tmux packages..."
  tpm_dir="$HOME/.tmux/plugins"

  if [ -d "$tpm_dir" ]; then
    (cd "$tpm_dir" && cd tpm && git pull)
  else
    mkdir -p "$tpm_dir"
    (cd "$tpm_dir" && git clone https://github.com/tmux-plugins/tpm)
  fi

  ~/.tmux/plugins/tpm/bin/install_plugins

  echo "[linux_setup.sh] Preferences installed - quit and reopen to take effect"
fi
