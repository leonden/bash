#!/bin/bash

# Strings of length <= 1 are not valid
# Spaces are allowed in the input but they should be stripped before checking
# all other non-digit characters are disallowed

# If doubling the number results in a number greater than 9 then subtract 9 from the product
# Then sum all of the digits

# If the sum is evenly divisible by 10, then the number is valid

if [ $# -ge 1 ]; then
    echo "Parameters are not allowed"
    exit 1
fi

echo "Enter a credit card number to validate:"
read -r num

echo "$num" | grep -qE '^([0-9]{4}[ ]){3}[0-9]{4}$'

if [ $? -eq 0 ]; then
    echo "$1 is a valid credit card number."
else
    echo "$1 is an invalid credit card number."
fi
