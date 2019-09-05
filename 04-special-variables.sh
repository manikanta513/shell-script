#!/bin/bash

##  Special variables are $0-$9, $*, $@, $# 

echo $0  ## Script name 
echo $1  # First argument parsed to the script 
echo $2

echo $* # all argumnents parsed
echo $@ # all argumnents parsed

echo $# # Number of arguments which are parsed