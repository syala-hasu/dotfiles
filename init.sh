#!/bin/bash
INIT_DIR=$(cd $(dirname $0); pwd)

$INIT_DIR/bash/init.sh
source ~/.bashrc
$INIT_DIR/vim/init.sh
