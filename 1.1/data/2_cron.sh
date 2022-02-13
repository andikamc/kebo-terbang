#!/bin/bash
sc_ver=$(cat /home/ver)
uuid=$(cat /proc/sys/kernel/random/uuid)
#
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi

# Action
echo "0 0 * * * root /usr/bin/update" > /etc/cron.d/daily-update
echo "0 0 * * * root /usr/bin/xp" > /etc/cron.d/daily-expire
#