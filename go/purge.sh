#!/bin/bash

if [ $OS = "Linux" ]; then
  sudo apt-get purge golang
  sudo apt-get autoremove
fi
