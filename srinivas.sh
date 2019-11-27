#!/bin/bash
app_id=$(ps -ef | grep $2 | awk '{print $2}')
echo 