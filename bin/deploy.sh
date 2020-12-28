#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)
DEPLOY_PATH=~/.dotfiles/bin

function main() {
  if [ ! -d ~/.dotfiles/bin ]; then
    mkdir -p ~/.dotfiles/bin
  fi

  cp -p $SCRIPT_DIR/function/* $DEPLOY_PATH
}

main
