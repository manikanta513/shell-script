#!/bin/bash
for i in `cat /usr/local/etc/group/cpi` ; do

        h=`echo -n $i | tail -c 2`
        echo $i
        echo $h
        ssh $i "/WCS/WebSphere70/AppServer/profiles/Lowes7OnlineA$h/bin/stopNode.sh"
        echo "++++++++++++++++++++Done for $i ++++++++++++++++++ "
done
