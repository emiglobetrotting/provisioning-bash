#!/bin/bash

#>>>>>>>>>> prepare
source prepare.sh
#<<<<<<<<<<


sudo -E bash ${MYDIR}/_ruby-rbenv-rails4-dep.sh

bash ruby-rbenv-gems.sh rails
