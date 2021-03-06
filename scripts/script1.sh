#!/bin/bash
# Name:         <script1.sh>
# Aufruf:       <script2.sh> [<1. Parameter>] [<2. Parameter>]
#               [<Beschreibung des 1. Parameters (falls vorhanden)>]
#               [<Beschreibung des 2. Parameters (falls vorhanden)>]
# Beschreibung: <if practise and exercise>
# Autor:        <Leon Hochwimmer>
# Version:      <0.1>
# Datum:        <31.05.2022>

num1=69
num2=420

if [ $num1 -eq $num2 ]
then
	echo "$num1 is equal to $num2"
else
	echo "$num1 is not equal to $num2"
fi

# -------------------------

file="/mnt/c/users/hocl1/workspace/github/bash/scripts/script1.sh"
if [ -e $file ]
then
	echo "the file this was written in exists"
else
	echo "this is a glitch in the matrix"
fi

# -------------------------

echo "hello $#"

echo "what is your name?"
read user
echo "nice to meet you $user"

# -------------------------

num=9

if [ $# != $num ]
then
	echo "there are $num parameters passed"
else
	echo " there are not $num parameters passed"
fi
