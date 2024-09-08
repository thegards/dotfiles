#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CONFIG_DIR=${XDG_CONFIG_HOME:-${HOME}/.config}

config_type=$1
case $1 in
  "initvim"|"lua") config_type=$1;;
  *) echo "Choose a config type: initvim|lua" && exit 1;;
esac

ln -snf ${SCRIPT_DIR}/nvimdir_${config_type}  ${CONFIG_DIR}/nvim
