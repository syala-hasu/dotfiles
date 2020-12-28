#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
DEPLOY_PATH=~/.dotfiles/zsh

function main() {
  if [ ! -d $DEPLOY_PATH ]; then
    mkdir -p $DEPLOY_PATH
  fi

  cp -p $SCRIPT_DIR/.zshrc $DEPLOY_PATH

  if [ -f ~/.zshrc ] ; then
    if [ -L ~/.zshrc ] ; then
      unlink ~/.zshrc
    else
      rm -f ~/.zshrc
    fi
  fi
  
  ln -s $DEPLOY_PATH/.zshrc ~/.zshrc
}

main

