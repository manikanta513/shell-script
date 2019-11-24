#!/bin/bash/
status_check()
{
touch output.txt
>output.txt
/opt/lucidworks/fusion/3.1.3/bin/fusion status >> output.txt
