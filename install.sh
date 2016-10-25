#!/bin/sh
#
# Install nice things

# check if OS X or linux
unamestr=`uname`
if [[ "$unamestr" == 'Darwin' ]]; then
  if test ! $(which brew); then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
  # install a few terminal basics
  brew install rbenv ruby-build zsh tmux mercurial wget htop vim
  # cask
  brew install caskroom/cask/brew-cask
  brew cask install alfred bartender dropbox iterm2 istat-menus karabiner seil slack spotify steam transmit viscosity
  # default to zsh shell
  chsh -s $(which zsh) $(whoami)
elif [[ "$unamestr" == 'Linux' ]]; then
  if [[ $EUID -ne 0 ]]; then
    sudo apt-get update
    sudo apt-get install -y tmux zsh git mercurial
  else
    apt-get install -y tmux zsh git mercurial
  fi
  if test ! $(which rbenv); then
    git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
    echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
    git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
  fi
fi

# setup vim/vundle
if [ ! -d '~/.vim/bundle/vundle' ]; then
  mkdir -p '~/.vim/bundle'
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle
  vim +PluginInstall +qall
fi

# install mercurial plugins
mkdir -p ~/src
cd ~/src
hg clone http://bitbucket.org/sjl/hg-prompt/
git clone https://github.com/schacon/hg-git.git
