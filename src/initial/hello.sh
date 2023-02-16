#!/bin/bash

if [ $# -eq 2 ]; then
    echo "Provided parameter is valid"
else
    echo "Provided parameters not valid"
    exit 1
fi

for i in A B C D; do
    echo $i
done

var=$((1 + 1))

echo $var
