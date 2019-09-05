#!/bin/bash

# Two loop commands
# 1. while 
# 2. for 

## Array Variables 
a=(10 20 30)
echo ${a[0]}
echo "${a[*]}"

for i in ${a[*]}; do 
    echo $i
done

for package in httpd tomcat mysqld ; do 
    echo Installing $package 
done