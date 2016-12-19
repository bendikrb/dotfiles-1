# pyro2927's dotfiles

## Setup

On OS X, you'll need `git` and the OS X command line tools installed (packaged with Xcode).

### Automatic

```bash
curl -sSL https://raw.githubusercontent.com/pyro2927/dotfiles/master/auto_install.sh | bash
```

### Manual

```bash
git clone https://github.com/pyro2927/dotfiles.git
cd dotfiles
sh ./install.sh
sh ./symlink.sh
```

### Install Script

The included install script sets installs my favorite/main programs, and then sets `zsh` as the default shell.

## Screenshot

![](./terminal2.png)

### Fonts

iTerm2 looks best with the solarizad dark theme and `14pt Meslo LG M DZ Regular for Powerline` font.

    wget https://raw.githubusercontent.com/altercation/solarized/master/iterm2-colors-solarized/Solarized%20Dark.itermcolors
    brew tap caskroom/fonts
    brew cask install font-meslo-lg-for-powerline
