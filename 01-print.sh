#!/bin/bash

## Demo on printing on screen.
# In shell scripting we can use either printf command or echo command to print content on scren.
# Printf command is not preferred because it needs lot of syntaxes and not much user friendly, Alternatively we have echo command which is user friendly and also does the same thing what printf comamnd does. So we are choosing echo command for printing some thing on the screen.

# syntax : echo String

echo Hello 
echo 9 
# echo command understands everthing as a string.

## Print multiple line
echo Hello 
echo New Hello

# Above operation can  also be done with single echo command by using escape(back) sequences.
echo Hello\nNewHello

# When you use escape sequences always use the input in quotes, Preferred Double Quotes

echo "Hello\nNewHello"

## WHenever you are using esacape sequences in echo command we have to enable an option -e to understand escape sequences.

echo -e "Hello\nNewHello"

# To print a tab space we use \t escape sequence. 
echo -e "Hello\tWorld"
echo -e "Hello\t\tWorld" ## TO print two tab spaces

### Printing Colors
## 1. Foreground color / Font screen
## 2. Background Color / Screen Color
## Refer : https://misc.flogisoft.com/bash/tip_colors_and_formatting

##                  Forground-Color         Background-Color
# Red                  31                       41
# Green                32                       42
# Yellow               33                       43 
# Blue                 34                       44 
# Magenta              35                       45
# Cyan                 36                       46 

# Disable color code : 0

# Syntax: echo -e "\e[COL-CODEmTEXT"
# Ex: echo -e "\e[31mTEXT"

echo -e "\e[31mTEXT"
echo -e "\e[31;43mTEXT"
echo -e "\e[31;43mHello\e[0mWorld"