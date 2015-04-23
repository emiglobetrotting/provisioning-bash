#!/bin/bash

#>>>>>>>>>> prepare
source prepare.sh
#<<<<<<<<<<


# root only
if [ ${MYUSER} != "root" ]
then
  echo "${MYUSER} can not run ${MYNAME}"
  exit 1
fi

# download nginx
MAJOR_VER="1.8"
MINOR_VER="0"
VER=${MAJOR_VER}.${MINOR_VER}
TAR=nginx-${VER}.tar.gz

cd ~
if [ -f ${TAR} ]
then
  rm -f ${TAR}
fi
${PRVENV_WGETCMD} http://nginx.org/download/${TAR}

# check already executing nginx
pgrep nginx >/dev/null
if [ $? -eq 0 ]
then
  ${PRVENV_CMD_INIT_STOP} nginx
fi

# install dependencies
bash ${MYDIR}/_nginx-src-dep.sh

# un-archive
if [ -d nginx-${VER} ]
then
  rm -fr nginx-${VER}
fi
tar zxf ${TAR}

# make, install
## http://wiki.nginx.org/InstallOptions
cd nginx-${VER}
./configure \
--with-http_ssl_module
make
make install

# init script
bash ${MYDIR}/_nginx-src-initscript.sh
