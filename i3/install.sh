#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

[ x"`uname`" != x"Linux" ] && echo "i3 only works on linux" && exit 0

[ -d ~/.config/i3 ] || mkdir -p ~/.config/i3

ln -snf $SCRIPT_DIR/i3-config      $HOME/.config/i3/config
