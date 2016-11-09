#!bash

SCRIPT_DIR=DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -s $SCRIPT_DIR/aliases       $HOME/.bash_aliases
ln -s $SCRIPT_DIR/bash_common   $HOME/.bash_common
ln -s $SCRIPT_DIR/profile       $HOME/.bash_profile
ln -s $SCRIPT_DIR/bashrc        $HOME/.bashrc
