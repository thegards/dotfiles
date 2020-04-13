#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CONFIG_DIR=${XDG_CONFIG_HOME:-${HOME}/.config}/systemd/user

[ x"`uname`" != x"Linux" ] && echo "systemd only works on linux" && exit 0

[ -d ${CONFIG_DIR} ] || mkdir -p ${CONFIG_DIR}

for service in ${SCRIPT_DIR}/user/*;
do
  service_name=$(basename ${service})
  ln -snvf ${service}                      ${CONFIG_DIR}/${service_name}
done
