#!/bin/bash/
validate()
{
    for i in `cat /tmp/output.txt` do
    j=`echo $i | awk -F "" '{print $3}'``
    if [ $j == "running" ]
    then
    echo $i
    else
    echo $i
    exit 1
    fi

}
status_check()
{
touch /tmp/output.txt
/opt/lucidworks/fusion/3.1.3/bin/fusion status > output.txt
validate
}

status_check