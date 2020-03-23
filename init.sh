#!/bin/bash
INIT_DIR=$(cd $(dirname $0); pwd)

$INIT_DIR/bash/init.sh
source ~/.bashrc > /dev/null 2>&1
$INIT_DIR/vim/init.sh
