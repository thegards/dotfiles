#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

[ x"`uname`" != x"Linux" ] && echo "morc_menu only works on linux" && exit 0

[ -d ~/.config/morc_menu ] || mkdir -p ~/.config/morc_menu

ln -snf ${SCRIPT_DIR}/morc_menu.conf ${HOME}/.config/morc_menu/morc_menu_v1.conf
