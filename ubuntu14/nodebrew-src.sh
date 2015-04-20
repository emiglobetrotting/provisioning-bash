#!/bin/bash

#>>>>>>>>>> prepare
MYNAME=`basename $0`
MYDIR=$(cd $(dirname $0) && pwd)
MYUSER=$(whoami)

# load environments
source ${MYDIR}/envs
#<<<<<<<<<<


# root only
if [ ${MYUSER} != "root" ]
then
  echo "${MYUSER} can not run ${MYNAME}"
  exit 1
fi

# download node
MAJOR_VER="0.10"
MINOR_VER="38"
VER=${MAJOR_VER}.${MINOR_VER}

# install nodebrew
curl -L git.io/nodebrew | perl - setup

# nodebrew install binary
nodebrew install-binary v${VER}
nodebrew use v${VER}
