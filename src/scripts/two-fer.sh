#!/bin/bash

if [ $# -ne 0 ]; then
    for i in $*; do
        echo "One for $i, one for me"
    done
else
    echo "One for you, one for me"
fi
