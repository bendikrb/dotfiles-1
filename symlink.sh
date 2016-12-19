#!/bin/bash
############################
# symlink.sh
# This script creates symlinks from the home directory to all dotfiles in ~/dotfiles
############################

REPO="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $REPO

for file in $(find . -name ".*" -not -name ".git" -not -name "." -not -name ".gitignore"); do
  ln -s $REPO/$file ~/$file
done
