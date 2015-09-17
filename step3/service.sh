#!/bin/bash

mount -t tmpfs shmfs -o size=4g /dev/shm

/usr/sbin/sshd -D &

while true; do
  status=`ps -ef | grep tns | grep oracle`
  pmon=`ps -ef | egrep pmon_$ORACLE_SID'\>' | grep -v grep`
  if [ "$status" == "" ] || [ "$pmon" == "" ]
  then
    su -s /bin/bash oracle -c "lsnrctl start"
    su -s /bin/bash oracle -c "sqlplus /nolog @?/config/scripts/startdb.sql"
    su -s /bin/bash oracle -c "lsnrctl status"
  fi
  sleep 1m
done;
