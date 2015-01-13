#!/bin/bash

#>>>>>>>>>> prepare
MYNAME=`basename $0`
MYDIR=$(cd $(dirname $0) && pwd)
MYUSER=$(whoami)

# load environments
source ${MYDIR}/envs
#<<<<<<<<<<


# args
## 1 = ruby version
RUBY_VER="2.2.0"
if [ $# -eq 1 ]
then
  RUBY_VER=${1}
  echo "ARGS(1) = ruby version = ${RUBY_VER}"
fi

# prepare dependency
bash ${MYDIR}/rbenv.sh

# check already installed
RBENV_BIN=$HOME/.rbenv/bin/rbenv
${RBENV_BIN} versions | grep ${RUBY_VER}
if [ $? -ne 0 ]
then
  echo "Ruby version ${RUBY_VER} is not installed yet. Start install."

  # install dependencies  *Note: required root priv
  sudo bash ${MYDIR}/_ruby-rbenv-dep.sh

  # install
  ${RBENV_BIN} install ${RUBY_VER}

  # post process
  ${RBENV_BIN} rehash
  ${RBENV_BIN} global ${RUBY_VER}
fi

# confirm
which ruby
ruby -v
