#!/bin/bash

# Quotes will escape the special characters.
# 1. Single Quotes
    # Strict quoting, it wont allow any special characters
# 2. Double Quotes ****
    # Liberal quoting, it will allow some special characters.
    # $
    # `
    # \
# 3. Backslash 

echo -e Hello\\nBYe

a=10
echo 'Value of a = $a'
echo "Value of a = $a"
