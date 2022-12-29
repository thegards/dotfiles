#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CONFIG_DIR=${XDG_CONFIG_HOME:-${HOME}/.config}

ln -snf ${SCRIPT_DIR}/alacritty.yml           ${CONFIG_DIR}/alacritty.yml
