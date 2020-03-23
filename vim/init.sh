#!/bin/sh
INIT_DIR=$(cd $(dirname $0); pwd)

# .vimディレクトリがなければ作成
if [ ! -d ~/.vim ]; then
    mkdir ~/.vim
fi

# vim-plugをダウンロード
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

$INIT_DIR/deploy.sh
