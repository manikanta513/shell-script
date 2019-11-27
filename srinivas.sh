#!/bin/bash
app_id=$(ps -ef | grep $1 | grep -v grep | awk '{print $2}')
echo $app_id