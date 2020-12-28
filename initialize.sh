#!/bin/bash

CURRENT_DIR=$(cd $(dirname $0); pwd)
DOTPATH=~/.dotfiles

#--------------------
# functions
#--------------------
function command_exist() {
  return `type $1 > /dev/null 2>&1`
}

function get_library() {
  DOWNLOAD_DIR=$DOTPATH/downloads
  if [ ! -d $DOWNLOAD_DIR ]; then
    echo "Create ${DOWNLOAD_DIR}"
    mkdir $DOWNLOAD_DIR
  fi

  cd $DOWNLOAD_DIR

  if command_exist curl ; then
    curl -LO $1
  elif command_exist wget ; then
    wget $1 -O $DOTPATH/downloads/
  else
    echo "required curl or wget!!!"
  fi

  cd $CURRENT_DIR
}

function make_dot_directory() {
  if [ ! -d $DOTPATH ]; then
    echo "Create ${DOTPATH}"
    mkdir $DOTPATH
  fi
}

#--------------------
# main
#--------------------
function main() {
  # make work dir
  make_dot_directory
  # download required library
  get_library https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
  get_library https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh 
}

main
