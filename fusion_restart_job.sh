#!/bin/sh
for i in `cat fusion_servers_weekly`
do
ssh $i "rm -rvf /tmp/fusion_status";
done
for name in `cat fusion_servers_weekly`
do
echo $name
echo""
ssh $name "su - fusadm -c  '/opt/lucidworks/fusion/3.1.3/bin/fusion stop'";
ssh $name "su - fusadm -c  '/opt/lucidworks/fusion/3.1.3/bin/fusion start'";
ssh $name "su - fusadm -c  '/nas/codedrop/CSCB_COMMERCE/fusion_weekly_restarts/fusion.sh'";
if [ $? -eq 0 ]
then
echo "Fusion services started properly in $name" | mail -s "Fusion - Weekly scheduled restart - $name - started successfully" DL-DIST-TEAM-SHERLOCK@lowes.com DL-DigitalMiddlewareEngineers@lowes.com
else
echo "Fusion did not start properly for $name, exiting " | mail -s "Fusion - Weekly scheduled restart - $name - failed"  DL-DIST-TEAM-SHERLOCK@lowes.com  DL-DigitalMiddlewareEngineers@lowes.com
break
fi
done
