#!/bin/bash


: "----- install package dependencies for ruby"
${PRVENV_CMD_PKG_INS} libffi-dev zlib1g-dev libssl-dev libreadline-dev mysql-client-5.6 libmysqld-dev
