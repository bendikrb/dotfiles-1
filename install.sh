#!/bin/sh
#
# Install nice things

if test ! $(which brew)
then
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
fi

brew install rbenv ruby-build fish tmux
