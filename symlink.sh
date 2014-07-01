#!/bin/bash
############################
# symlink.sh
# This script creates symlinks from the home directory to all dotfiles in ~/dotfiles
############################

REPO=$(pwd)

cd $REPO

for file in $(find . -name ".*" -not -name ".git" -not -name "."); do
  ln -s $REPO/$file ~/$file
done
