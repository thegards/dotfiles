#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

[ x"`uname`" != x"Linux" ] && echo "i3 only works on linux" && exit 0

[ -d ~/.config/i3status ] || mkdir -p ~/.config/i3status

ln -snf $SCRIPT_DIR/i3status-config      $HOME/.config/i3status/config
