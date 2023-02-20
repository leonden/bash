#!/bin/bash

# Strings of length <= 1 are not valid
# Spaces are allowed in the input but they should be stripped before checking
# all other non-digit characters are disallowed

# If doubling the number results in a number greater than 9 then subtract 9 from the product
# Then sum all of the digits

# If the sum is evenly divisible by 10, then the number is valid

# --------------------------------------------------------------------------------------------------

# # Check if the provided arguments
# if [ $# -lt 1 ]; then
#     echo "No credit card number provided"
#     exit 1
# elif [ $# -eq 4 ]; then
#     num="$1$2$3$4"
#     echo "$num"
# elif [ $# -eq 1 ]; then
#     dash="-"
#     if [[ $1 == *"$dash"* ]]; then
#         echo "$1" | sed "s/-//g"
#         reverse "$1"
#     else
#         echo "$1" | sed "s/ //g"
#         reverse "$1"
#     fi
# fi

# Check if an argument is provided
if [ -z "$1" ]; then
    echo "No credit card number provided"
    exit 1
fi

# Remove all non-numeric characters from the input
remove_non_digits() {
    echo "$1" | tr -d -c [:digit:]
}
ccnum=$(remove_non_digits "$1")

# Reverse the credit card number
reverse_string() {
    echo "$1" | rev
}
ccnumrev=$(reverse_string "$ccnum")

# Calculate the sum of the digits in the odd positions
sum_odds() {
    sum=0
    for ((i = 0; i < ${#1}; i += 2)); do
        sum=$((sum + ${1:$i:1}))
    done
    echo "$sum"
}
odds=$(sum_odds "$ccnumrev")

# Double the digits in the even positions and sum the digits of the resulting number
sum_evens() {
    sum=0
    for ((i = 1; i < ${#1}; i += 2)); do
        digit=$((${1:$i:1} * 2))
        if [ $digit -gt 9 ]; then
            digit=$((digit - 9))
        fi
        sum=$((sum + digit))
    done
    echo "$sum"
}
evens=$(sum_evens "$ccnumrev")

echo "The result is" $((odds + evens))

# Add the sums of the odd and even positions
add_sums() {
    echo $(($1 + $2))
}

total=$(add_sums "$odds" "$evens")

# Check if the total is divisible by 10
is_valid() {
    if [ $(($1 % 10)) -eq 0 ]; then
        echo "Valid credit card number"
    else
        echo "Invalid credit card number"
    fi
}
is_valid "$total"
