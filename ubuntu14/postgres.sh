#!/bin/bash

#>>>>>>>>>> prepare
source prepare.sh
#<<<<<<<<<<


set -e

[ $(isroot) ] || { echo "${MYUSER} can not run ${MYNAME}"; exit 1; }

: "----- install postgres"
${PRVENV_CMD_PKG_INS} postgresql

/etc/init.d/postgresql start
