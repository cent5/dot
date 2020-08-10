#!/bin/bash

tmp_dir=~/.dot-setup-tmp

# Check for the presence of git
git --version 2>&1 >/dev/null # improvement by tripleee
GIT_IS_AVAILABLE=$?

# Create temporary directory for working within
rm -rf $tmp_dir
mkdir $tmp_dir

function git_clone {
     echo ""
     echo $(tput setaf 2)"--> Cloning dot..."$(tput sgr0)
     echo ""
    git clone https://github.com/cent5/dot.git $tmp_dir/dot
}

read -p $(tput setaf 3)"Are you sure you would like to continue? (y/N) "$(tput sgr0)

if [[ $REPLY =~ ^[Yy]$ ]]; then
  if [ $GIT_IS_AVAILABLE -eq 0 ]; then
    git_clone
  else
    exit 1
  fi

  cp $tmp_dir/dot/dotfiles/.bash_aliases ~/.bash_aliases
  cp $tmp_dir/dot/dotfiles/.gitconfig ~/.gitconfig
  cp $tmp_dir/dot/dotfiles/.inputrc ~/.inputrc
  rm -rf $tmp_dir
else
  echo "--> Aborted."
fi
