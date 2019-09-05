#!/bin/bash

## Two conditional commands are available in shell scripting, Also called as flow control commands
# 1. Case
# 2. If

## Case syntax
# case $var in 
#   patt1) commands ;;
#   patt2) commands ;;
# esac

ID=$(id -u -n)
case $ID in 
    root)
       # # # some commands 
       echo "You are a root user" 
       ;;
    *) 
       # # # Some commands
       echo "You are a non-root user"
       ;;
esac

## If-Statements

## USually if can be seen in three forms.
## 1. Simple-IF
        ## In case if you want to check a condition and executes some command if that conditions is true. Simple if will not do anything if condition is not true.
        # if [ expression ]; then 
                # commands
        # fi 

## 2. If-Else
        ## In case if you want to check a condition and executes some command if that condition is true and also we are going to execute some other command if that condition is false.
        # if [ expression ]; then 
            # commands
        # else 
            # commands
        # fi 

## 3. Else-IF
        # In a case if you have multiple expressions/conditions to validate we use else-if.
        # if [ expression ]; then 
            # commands
        # elif [ expression ]; then 
            # commands
        # fi 

## You have seen expressions during all the syntaxes, Expressions is categorized in three ways.
# 1. Expressions on Strings
# 2. Expressions on Numbers
# 3. Expressions on Files  

## You can explore all these expression operators with "man bash" command. To jump to expressions directcly  in man bash then search for /-eq 

ID=$(id -n -u)
if [ $ID = root ]; then 
    echo "You are a root user"
else 
    echo "You are a non-root user"
fi 
