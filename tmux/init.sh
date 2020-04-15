#!/bin/bash

if [ $OS = "Linux" ]; then
  sudo apt-get update
  sudo apt-get install tmux
fi

