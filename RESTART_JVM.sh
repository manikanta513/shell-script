#!/bin/bash/

commerce(){
    ssh $2 "su -wasadm -c 'ps -ef | grep java | grep -v grep | xargs' "
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
