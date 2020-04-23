#!/bin/bash
INIT_DIR=$(cd $(dirname $0); pwd)
# cd $INIT_DIR

if [ ! -f ~/.bash_profile ] ; then
  touch ~/.bash_profile
fi

if [ -f ~/.bashrc ] ; then
  if [ -L ~/.bashrc ] ; then
    unlink ~/.bashrc
  else
    rm -f ~/.bashrc
  fi
fi

ln -s $INIT_DIR/.bashrc ~/.bashrc

grep 'if \[ -f ~/.bashrc \] ; then' ~/.bash_profile > /dev/null 2>&1

if [ $? = 1 ] ; then
  echo "" >> ~/.bash_profile
  echo "if [ -f ~/.bashrc ] ; then" >> ~/.bash_profile
  echo "    . ~/.bashrc" >> ~/.bash_profile
  echo "fi" >> ~/.bash_profile
fi

# git
git config --global user.email "syalahasu@gmail.com"
git config --global user.name "Ekahs"

. $INIT_DIR/util/get_os 
OS=`get_os`

if [ $OS = "Mac" ] ; then
  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > ~/.git-completion
  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > ~/.git-prompt

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
elif [ $OS = "Linux" ] ; then
  wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O ~/.git-completion
  wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -O ~/.git-prompt
fi

