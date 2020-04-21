#!/bin/bash
for i in `cat /usr/local/etc/group/cpi` ; do

        h=`echo -n $i | tail -c 2`
        echo $i
        echo $h
        ssh $i "sed -i 's/i01/i$i/g /etc/init.d/application_task "
        echo "++++++++++++++++++++Done for $i ++++++++++++++++++ "
done
