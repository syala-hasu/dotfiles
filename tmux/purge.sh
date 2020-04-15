#!/bin/bash

if [ $OS = "Linux" ]; then
  sudo apt-get purge tmux
  sudo apt-get autoremove
fi

