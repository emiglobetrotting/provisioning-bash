#!/bin/bash

#>>>>>>>>>> prepare
source prepare.sh
#<<<<<<<<<<


# args
## 1 = envfile path(default: "~/.bashrc", if only non-privilledged user)
declare ENV_RC=${PRVENV_DEFAULT_BASHRC}
if [ ${MYUSER} != "root" ]
then
  ENV_RC=${PRVENV_USER_BASHRC}
fi
echo "envfile path = ${ENV_RC}"

# check already installed
declare -r RBENV_ROOT=${HOME}/.rbenv
grep "${RBENV_ROOT}" ${ENV_RC}
if (( $? ))
then
  # clone
  git clone https://github.com/sstephenson/rbenv.git ${RBENV_ROOT}

  # ruby-build plugin
  cd ${RBENV_ROOT}
  mkdir plugins
  cd plugins
  git clone https://github.com/sstephenson/ruby-build.git

  # rbenv-default-gems plugin
  git clone https://github.com/sstephenson/rbenv-default-gems.git

  # rbenv-gem-rehash plugin
  git clone https://github.com/sstephenson/rbenv-gem-rehash.git

  # set environments
  echo "export PATH=${RBENV_ROOT}/bin"':$PATH' >> ${ENV_RC}
  #[[ -s "${RBENV_ROOT}/bin/rbenv" ]] && eval "$(rbenv init -)"
  echo 'eval "$(rbenv init -)"' >> ${ENV_RC}
  source ${ENV_RC}
fi

# confirm rbenv version
rbenv --version
