#!/bin/bash
mv_ver="1.1"
sc_ver=$(cat /home/ver)
uuid=$(cat /proc/sys/kernel/random/uuid)

####################################
rm /usr/bin/update
echo "[GETTING FROM PANGOLIER@DK-NET]"
echo "Starting Update (1/2) ..."
wget -q -O /usr/bin/update "https://raw.githubusercontent.com/andikamc/kebo-terbang/pangolier/$sc_ver/data/1_update.sh?__no_cache=true&__fragment=$uuid"
chmod +x /usr/bin/update && shc -f /usr/bin/update -o /usr/bin/update && rm /usr/bin/update.*
echo "Starting Update (2/2) ..."
wget -q -O /usr/bin/cron "https://raw.githubusercontent.com/andikamc/kebo-terbang/pangolier/$sc_ver/data/2_cron.sh?__no_cache=true&__fragment=$uuid"
chmod +x /usr/bin/cron && shc -f /usr/bin/cron -o /usr/bin/cron && rm /usr/bin/cron.*
####################################

# change version
echo "$mv_ver" > /home/ver
echo "Script updated to $mv_ver from $sc_ver"