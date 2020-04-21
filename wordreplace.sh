#!/bin/bash
for i in `cat /usr/local/etc/group/cpi` ; do

        h=`echo -n $i | tail -c 2`
        echo $h
        ssh $i "/WCS/WebSphere70/AppServer/profiles/Lowes7OnlineA$h/bin/stopNode.sh"
        ssh $i "su - wasadm -c '/WCS/WebSphere70/AppServer/profiles/Lowes7OnlineA$h/bin/startNode.sh'"
                echo "++++++++++++++++++++Done for $i ++++++++++++++++++ "
done
