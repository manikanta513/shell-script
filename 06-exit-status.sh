#!/bin/bash

# Exit status is the status of executed command. It (Status) can be accessed through a special variable i.e $? 

ls
echo $? # Usually you get numbers, SO means exit status is a number all the time.
# Exit states ranges from 0-255
# 0 -> Successful executing of command
# 1-255 -> Partial Success / Partial Failure / COmplete Failure

func1() {
    echo Hello 
    ## If I keep exit command over here then it terminates not the function but the complete script
    return 10 ## Return command can carry the function status to main program 
    echo Bye
}

func1 
echo Exit status of function = $?

exit 1
echo Hello