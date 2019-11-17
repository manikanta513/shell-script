#!/bin/sh
/opt/lucidworks/fusion/3.1.3/bin/fusion status >> /tmp/fusion_status
NO_LINES=$(cat /tmp/fusion_status | wc -l)
RUNNING_FUSION=$(cat /tmp/fusion_status | awk '{print $1 " " $2 " " $3}' | grep running | wc -l)
if [ $NO_LINES -eq $RUNNING_FUSION ]; then echo "Fusion is running fine"; else echo "Fusion is not running fine"; exit 1; fi
rm -rf /tmp/fusion_status
