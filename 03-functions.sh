#!/bin/bash

## Declare a function
func_name() {
    local a=20
    ## Sometimes variables need to be declared in local to functions
    # local a=20
    echo value of a in function = $a
}

func2() {
    echo Hello
    return
    echo BYe
}

systemload()
{
    echo load = $(uptime | awk -f : '{print $NF}' | awk -f , '{print $1}')
    echo number of users logged in = $(who | wc -l)
}


## You can access the function as simple as a command.
func_name
echo value of a in main program = $a

func2 

systemload


## Observations
## Variable declared in main program can be accessed in function and vice-versa
