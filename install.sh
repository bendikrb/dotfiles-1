#!/bin/sh
#
# Install nice things

# check if OS X or linux
unamestr=`uname`
if [[ "$unamestr" == 'Darwin' ]]; then
  if test ! $(which brew); then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
  brew install ansible
  ansible-galaxy install geerlingguy.homebrew
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
