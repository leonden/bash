#!/bin/bash

if [ $# -eq 2 ]; then
    echo "Provided parameter is valid"
else
    exit 1
fi

echo "The first provided parameter is $1"
echo "The second provided parameter is $2"
