#!/bin/sh
INIT_DIR=$(cd $(dirname $0); pwd)
cd $INIT_DIR

ln -s $INIT_DIR/.bashrc ~/.bashrc

grep 'if \[ -f ~/.bashrc \] ; then' ~/.bash_profile > /dev/null 2>&1

if [ $? = 1 ] ; then
  echo "" >> ~/.bash_profile
  echo "if [ -f ~/.bashrc ] ; then" >> ~/.bash_profile
  echo "    . ~/.bashrc" >> ~/.bash_profile
  echo "fi" >> ~/.bash_profile
fi
