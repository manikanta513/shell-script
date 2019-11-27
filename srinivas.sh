#!/bin/bash
app_id=$(ps -ef | grep $1 | awk '{print $2}')
echo $app_id