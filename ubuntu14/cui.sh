#!/bin/bash

#>>>>>>>>>> prepare
set -eu

declare -r MYNAME=`basename $0`
declare -r MYDIR=$(cd $(dirname $0) && pwd)
declare -r MYUSER=$(whoami)

# load environments
source ${MYDIR}/envs
#<<<<<<<<<<


# root only
if [ ${MYUSER} != "root" ]
then
  echo "${MYUSER} can not run ${MYNAME}"
  exit 1
fi

# install packages for cui environment
${PRVENV_CMD_PKG_INS} ncurses-term screen tmux git subversion zsh vim stow ctags lv
