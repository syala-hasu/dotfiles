#!/bin/bash

if [ $OS = "Linux" ]; then
  sudo apt-get purge tmux
  sudo apt-get autoremove
fi

if [ $OS = "Mac" ]; then
  brew uninstall tmux
fi
