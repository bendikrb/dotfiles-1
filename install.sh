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
  brew install rbenv ruby-build fish tmux
  chsh -s $(which fish) $(whoami)
elif [[ "$unamestr" == 'Linux' ]]; then
  sudo apt-get update
  sudo apt-get install -y tmux fish git
  if test ! $(which rbenv)
  then
    git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
    echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
    git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
  fi
fi

#setup vim/vundle
$DIRECTORY='~/.vim/bundle/vundle'
if [ ! -d $DIRECTORY ]; then
  git clone https://github.com/gmarik/Vundle.vim.git $DIRECTORY
  vim +PluginInstall +qall
fi
