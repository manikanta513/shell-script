#!/bin/bash
app_id=`ps -ef | grep $1 | grep -v grep | awk '{print $2}' | awk '{print $NF}'`
echo $app_id