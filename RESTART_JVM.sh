#!/bin/bash/

stat()



commerce(){
    ssh $2 "su -wasadm -c 'ps -ef | grep java | grep -v grep | awk -F' ' '{print $2}' |xargs kill -9' "
    stat $?
}

























case $1 in 
commerce)
commerce
;;
sc)
sc
;;
pricing)
pricing
;;
mylowes)
mylowes
;;
mow)
mow
;;
iservice)
iservice
;;
