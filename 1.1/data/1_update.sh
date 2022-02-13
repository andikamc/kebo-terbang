#!/bin/bash
sc_ver=$(cat /home/ver)
uuid=$(cat /proc/sys/kernel/random/uuid)
#
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi

echo "Starting Update (1/2) ..."

# Action
wget --no-verbose -q -O /tmp/__tmp_update "https://raw.githubusercontent.com/andikamc/kebo-terbang/pangolier/$sc_ver/updater.sh?__no_cache=true&__fragment=$uuid"
chmod +x /tmp/__tmp_update && shc -f /tmp/__tmp_update -o /tmp/__tmp_update && sh -c /tmp/__tmp_update && rm -f /tmp/__tmp_update.*
sleep 3
#

echo "Success Update (1/2) ..."