#!/bin/sh
#
# Install nice things

# check if OS X or linux
unamestr=`uname`
if [[ "$unamestr" == 'Darwin' ]]; then
  if test ! $(which brew)
  then
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
  fi
  # install a few terminal basics
  brew install rbenv ruby-build fish tmux mercurial
  # cask
  brew install caskroom/cask/brew-cask
  brew cask install google-chrome dropbox iterm2 istat-menus razer-synapse karabiner viscosity alfred bartender steam spotify
  # default to fish shell
  chsh -s $(which fish) $(whoami)
elif [[ "$unamestr" == 'Linux' ]]; then
  sudo apt-get update
  sudo apt-get install -y tmux fish git mercurial
  if test ! $(which rbenv)
  then
    git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
    echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
    git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
  fi
fi

# setup vim/vundle
$DIRECTORY='~/.vim/bundle/vundle'
if [ ! -d $DIRECTORY ]; then
  git clone https://github.com/gmarik/Vundle.vim.git $DIRECTORY
  vim +PluginInstall +qall
fi

# install mercurial plugins
mkdir -p ~/src
cd ~/src
hg clone http://bitbucket.org/sjl/hg-prompt/
git clone https://github.com/schacon/hg-git.git
