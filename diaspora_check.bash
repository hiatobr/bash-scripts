#!/bin/bash

COMMAND=`nmap -p 3000 127.0.0.1 | grep -e 'open'`
MESSAGE="3000/tcp open  ppp"
DAEMON="/etc/init.d/diaspora restart"
LOG="/home/hiato/var/log/diaspora_check.log"


if [ "${COMMAND}" == "${MESSAGE}" ]
then
	echo "[${0}] (`date`): Porta 3000 escutando normalmente." 1>> "${LOG}"
else
	${DAEMON}
fi

