#!/bin/bash

#>>>>>>>>>> prepare
MYNAME=`basename $0`
MYDIR=$(cd $(dirname $0) && pwd)

# load environments
source ${MYDIR}/envs
#<<<<<<<<<<


# install default packages
${PRVENV_CMD_PKG_UPD}
## net-tools has been unavailable
#${PREENV_CMD_PKG_INS} net-tools nmap-ncat strace bind-utils traceroute tcpdump jwhois sysstat lsof wget epel-release
${PREENV_CMD_PKG_INS} nmap-ncat strace bind-utils traceroute tcpdump jwhois sysstat lsof wget epel-release
${PRVENV_CMD_PKG} groupinstall "Development Tools"

# copy files
COPY_TARGETS=("/etc/locale.conf")
for target in ${COPY_TARGETS[@]}
do
  cp ${MYDIR}/files/${MYNAME}${target} ${target}
done

# timezone is JST
rm /etc/localtime
ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
