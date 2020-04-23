#!/bin/bash

if [ $OS = "Linux" ]; then
  sudo apt-get purge golang
  sudo apt-get autoremove
fi

if [ $OS = "Mac" ]; then
  brew uninstall go
fi
