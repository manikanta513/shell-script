#!/bin/bash
server=$2
echo $server
stat()
{
if [ "$1" -ne 0 ]; then
echo -e "\e[31mnot successfull\e[0m"
exit 2
else
echo -e  "\e[32msuccessfull\e[0m"
fi
}


commerce() {
    ssh $server "su - wasadm -c 'pkill -f java'"
    stat $? 
    ssh $server "su - wasadm -c '/WCS/WebSphere70/AppServer/profiles/Lowes7OnlineA*/bin/startNode.sh; service jvma1_was.init start; service jvma2_was.init start; service jvma3_was.init start'"
}

sc() {
    ssh $server "su -wasadm -c 'pkill -f java'"
    stat $? 
    ssh $server "su -wasadm -c '/WCS/WebSphere70/AppServer/profiles/SCSharedA*/bin/startNode.sh; service jvma1_was.init start; service jvma2_was.init start'"
}

pricing() {
    ssh $server "su -wasadm -c 'pkill -f java'"
    stat $? 
    ssh $server "su -wasadm -c '/WCS/WebSphere70/AppServer/profiles/SCSharedA*/bin/startNode.sh; service jvma1_was.init start; service jvma2_was.init start'"
}

mylowes() {
    ssh $server "su - wasadm -c 'pkill -f java'"
    stat $? 
    ssh $server "su - wasadm -c '/WCS/WebSphere70/AppServer/profiles/MyLowesA*/bin/startNode.sh; service jvma1_was.init start; service jvma2_was.init start'"
}

mow() {
    ssh $server "su - wasadm -c 'pkill -f java'"
    stat $? 
    ssh $server "su - wasadm -c '/WCS/WebSphere70/AppServer/profiles/IServicesA*/bin/startNode.sh; service jvma1_was.init start; service jvmd2_was.init start'"
    ssh $server "su - wasadm -c '/WCS/WebSphere70/AppServer/profiles/MobileWebA*/bin/startNode.sh; service jvmc1_was.init start; service jvmc2_was.init start'"
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
esac
