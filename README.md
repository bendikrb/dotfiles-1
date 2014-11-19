# pyro2927's dotfiles

Tired of using Dropbox, going to move all my dotfiles over to here.

## Setup

### Automatic

    curl -sSL https://raw.githubusercontent.com/pyro2927/dotfiles/master/auto_install.sh | bash

### Manual

    git clone https://github.com/pyro2927/dotfiles.git
    cd dotfiles
    sh ./install.sh
    sh ./symlink.sh

### Install Script

The included install script sets up homebrew, installs my favorite/main programs, and then sets `fish` as the default shell.

## Screenshot

![](./terminal2.png)

## Notes

### Fonts

iTerm2 looks best with the solarizad dark theme and `14pt Meslo LG M DZ Regular for Powerline` font.

    wget https://raw.githubusercontent.com/altercation/solarized/master/iterm2-colors-solarized/Solarized%20Dark.itermcolors
    brew tap caskroom/fonts
    brew cask install font-meslo-lg-for-powerline
