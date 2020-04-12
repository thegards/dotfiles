#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir -p ${HOME}/.config/morc_menu

ln -snf ${SCRIPT_DIR}/morc_menu.conf ${HOME}/.config/morc_menu/morc_menu_v1.conf
