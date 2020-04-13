#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -snf ${SCRIPT_DIR}/tmux.conf            ${HOME}/.tmux.conf
ln -snf ${SCRIPT_DIR}/tmuxdir              ${HOME}/.tmux
