# Briant's Better Dotfiles

![Terminals Forever](https://www.commitstrip.com/wp-content/uploads/2016/12/Strip-Lignes-de-commande-english650-final-2.jpg)

This repo contains my dotfiles, as well as a few scripts used to make maintaining them on multiple machines simpler.

## Installation And Setup
Must install in order
- `$ ./install_apps.sh` installs required applications
- `$ ./setup.sh` links and copies all the configuration files from the config folder
- You must **RESTART** the machine to ensure the 'Powerline' fonts are recognized by the system
  - This affects:
    - all airline plugins fonts used in vim
    - all fonts used in the 'tmux' title bar
    - any other additional 'Powerline' font dependant systems

## TMux Config
- Prefix - CTRL+ a
- Rename Session - <Prefix> + $
- List Windows - <Prefix> + w
- New Window - <Prefix> + c
- Next Window - <Prefix> + n
- Rename Window - <Prefix> + ,
- Maximize Window - <Prefix> + z
- Split Horizontally - <Prefix> + v
- Split Vertically - <Prefix> + b
- Navigate Panes - <Prefix> + [h,j,k,l]
- Show History - <Prefix> + ~
- Reload Config - <Prefix> + r
- Show Time - <Prefix> + t

## VIM Config
- , - Leader
- i - Insert Mode
- cc - Insert and indent current line
- o - Open new line below and set to insert mode
- O - Open new line above and set to insert mode
- , + o - Open a new below
- , + O - Open a new line above
- A - Set to insert mode at the end of the current line
- I - Set to insert mode at the beginning of the current line
- gg - Go to top of file
- G - Go to bottom of file

## VIM Plugins
- <Leader> m - List open buggers
- <CTRL> p - Fuzzyfind
- <CTRL> n - Nerdtree
