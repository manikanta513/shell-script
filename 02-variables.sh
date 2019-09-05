#!/bin/bash

a=10 # declare a intiger
b=10.0 # floating value
c=DevOps # character value

# we can access a variable in shell by using $ character precceding to variabel and variable bounded in flower paranthesis. "${a}", Ideally this is difficult to use parathasis all the time so you can access with out them as well if it is not an array variable. $a

## TO print variables for demonstration we are using echo command. That does not mean you can access variables only with echo command. You can parse variables to any command.

echo ${a}
echo $a 
echo $b
echo $c

## Variables do not have data types by default in shell scripting. For a beginer is a very good adavantage and need not to worry about data types, Where as going forward on complex script some times we may feel having data type is really needed.

## Explore how to define variable with data type.

## Variables are local , So we need some variables across the environment (Assume you are in terminal and you want to access the terminal variables inside a script wich we execute inside the same terminal)

## Accessing NAME variable which is declared inside my terminal
echo $NAME

# Some times static data cannot be used. For and example
DATE=2019-02-11
echo Todays date is $DATE

## To overcome the static data , we can approach system to execute some commands and we can fetch that output to a variable, That mechanism totally is called as command substitution.

# Syntax: VAR=$(commands)  , $(command1;command2) , $(command1|command2)
DATE1=$(date +%Y-%m-%d)
echo Todays date is $DATE1

## Variable names should be the following characters
# 1. Alphabets ( either small or capital)
# 2. Numbers (0-9)
# 3. Underscore (_)

# A variable should not start with a number