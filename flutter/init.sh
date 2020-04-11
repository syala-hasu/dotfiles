#!/bin/bash

# ディレクトリがなければ作成
if [ ! -d ~/.dotfile ]; then
    mkdir ~/.dotfile
fi

git clone https://github.com/flutter/flutter.git ~/.dotfile/flutter -b stable

export PATH=$PATH:~/.dotfile/flutter/bin

flutter channel dev
flutter upgrade
flutter config --enable-web
flutter doctor
