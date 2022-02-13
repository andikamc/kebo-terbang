#!/bin/bash
mv_ver="1.1"
sc_ver=$(cat /home/ver)
uuid=$(cat /proc/sys/kernel/random/uuid)

#
rm /usr/bin/update
wget -q -O /usr/bin/update "https://raw.githubusercontent.com/andikamc/kebo-terbang/pangolier/data/update.sh?__no_cache=true&__fragment=$uuid"
chmod +x /usr/bin/update && shc -f /usr/bin/update -o /usr/bin/update && rm /usr/bin/update.*

# change version
echo "$mv_ver" > /home/ver
echo "Script updated to $mv_ver from $sc_ver"