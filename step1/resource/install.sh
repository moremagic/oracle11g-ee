#!/bin/bash
mount -t tmpfs shmfs -o size=4g /dev/shm

date
su -s /bin/bash oracle -c "cd /tmp/install/database/ && ./runInstaller -waitforcompletion -ignoreSysPrereqs -ignorePrereq -silent -noconfig -responseFile /tmp/db_install.rsp"

