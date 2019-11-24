#!/bin/bash/
validate()
{
    for i in `cat /tmp/output.txt`
    echo $i | awk 
}
status_check()
{
touch /tmp/output.txt
>/tmp/output.txt
/opt/lucidworks/fusion/3.1.3/bin/fusion status >> output.txt
validate
}