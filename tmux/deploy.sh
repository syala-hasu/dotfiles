#!/bin/bash
INIT_DIR=$(cd $(dirname $0); pwd)

if [ -f ~/.tmux.conf ] ; then
  if [ -L ~/.tmux.conf ] ; then
    unlink ~/.tmux.conf
  else
    rm -f ~/.tmux.conf
  fi
fi

ln -s $INIT_DIR/.tmux.conf ~/.tmux.conf
