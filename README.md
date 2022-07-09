# Brennick's Better Dotfiles

![Terminals Forever](https://www.commitstrip.com/wp-content/uploads/2016/12/Strip-Lignes-de-commande-english650-final-2.jpg)

This repo contains my dotfiles, as well as a few scripts used to make maintaining them on multiple machines simpler.

## Installation And Setup
Must install in order
- `$ ./install_apps.sh` installs required applications
  - You might need to run this command as a `sudo` user to install a couple of the apps. Brew will complain for the majority of the installed apps, however there will be a few that will be installed despite the brew issues.
  - Yes, this means the script might need to be run a second time to get everything installed correctly
- `$ ./setup.sh` links and copies all the configuration files from the config folder
- You must **RESTART** the machine to ensure the 'Powerline' fonts are recognized by the system
  - This affects:
    - all airline plugins fonts used in vim
    - all fonts used in the 'tmux' title bar
    - any other additional 'Powerline' font dependant systems
- To get the Tmux battery/cpu/mem/date to show up correctly the following commnd must be executed from within the Tmux env
  - `<prefix> + I`
  - `<prefix>` should be the following `Ctl+a` once the `./install-apps.sh` and `./setup.sh` scripts are run
- The `~/.zshrc` file needs to have the `oh-my-zsh.sh` pathway updated with your local system's user name or Oh-My-Zsh will not load and work correctly

## TMux Windows for Tmuxinator
- Follow this link [Templating Tmux with tmuxinator](https://thoughtbot.com/blog/templating-tmux-with-tmuxinator)
- In short.. execute this: `tmux list-windows`
    - Which will give something like this:
        ```
1: editor* (2 panes) [208x60] [layout 741e,208x60,0,0{104x60,0,0,0,103x60,105,0,5}] @0 (active)
2: console- (3 panes) [208x60] [layout cd1d,208x60,0,0{104x60,0,0[104x30,0,0,1,104x29,0,31,3],103x60,105,0,4}] @1
        ```
    - Copy this part to the Tmuxinator "layout" section:
        ```
741e,208x60,0,0{104x60,0,0,0,103x60,105,0,5}
cd1d,208x60,0,0{104x60,0,0[104x30,0,0,1,104x29,0,31,3],103x60,105,0,4}
        ```

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
