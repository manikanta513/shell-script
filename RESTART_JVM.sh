#!/bin/bash/

stat()
{
if [ "$1" -ne 0 ]; then
echo -e "\e[31mnot successfull\e[0m"
exit 2
else
echo -e  "\e[32msuccessfull\e[0m"
fi
}


commerce(){
    ssh $2 "su -wasadm -c 'ps -ef | grep java | grep -v grep | awk -F' ' '{print $2}' |xargs kill -9' "
    stat $?startNo
    ssh $2 "su -wasadm -c '/WCS/WebSphere70/AppServer/profiles/Lowes7OnlineA*/bin/startNo'"
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
