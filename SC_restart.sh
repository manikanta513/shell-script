#!/bin/bash

stat()
{
if [ "$1" -ne 0 ]; then
echo -e "\e[31mnot successfull\e[0m"
exit 2
else
echo -e  "\e[32msuccessfull\e[0m"
fi
}

for i in `cat /usr/local/etc/group/mani_sc`;
do
echo "stopping jvm on $i"
ssh $i "su - wasadm -c 'service jvma2_was.init stop'"
stat $?
echo "starting jvm on $i"
ssh $i "su - wasadm -c 'service jvma2_was.init start'"
stat $?
done





