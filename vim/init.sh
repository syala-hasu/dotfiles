#!/bin/sh
INIT_DIR=$(cd $(dirname $0); pwd)
cd $INIT_DIR

if [ ! -e ~/.vim ]; then
    mkdir ~/.vim
fi

ln -s $INIT_DIR/config ~/.vim/config
ln -s $INIT_DIR/.vimrc ~/.vimrc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +":PlugInstall" +":qa"
