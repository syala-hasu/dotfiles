#!/bin/bash

if [ $OS = "Linux" ]; then
  sudo apt-get update
  sudo apt-get install golang
fi

if [ $OS = "Mac" ]; then
  brew install go
fi
