#!/bin/zsh
INIT_DIR=$(cd $(dirname $0); pwd)

if [ ! -d ~/.vim ] ; then
  echo -e 'Not initialized'
  echo -e 'Run init.sh'
  exit 1
fi

if [ -d ~/.vim/config ] ; then
  if [ -L ~/.vim/config ] ; then
    unlink ~/.vim/config
  else
    rm -rf ~/.vim/config
  fi
fi

if [ -f ~/.vimrc ] ; then
  if [ -L ~/.vimrc ] ; then
    unlink ~/.vimrc
  else
    rm -f ~/.vimrc
  fi
fi

ln -s $INIT_DIR/config ~/.vim/config
ln -s $INIT_DIR/.vimrc ~/.vimrc

vim +":PlugInstall" +":qa"
