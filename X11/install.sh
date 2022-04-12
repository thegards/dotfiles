#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

IS_UBUNTU=`uname -v | grep -Eio 'Ubuntu'`

# If installing in Ubuntu boxes, preprocess Xresources because ubuntu stinks
if [[ x$UNAME_V == x"Ubuntu" ]]
then
  cpp -P  ${SCRIPT_DIR}/Xresources         > ${HOME}/.Xresources
else
  ln -snf ${SCRIPT_DIR}/Xresources           ${HOME}/.Xresources
fi
