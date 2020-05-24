#!/bin/bash
#Demo the use of shift and while loops

echo "Parameters 1: $1"
echo "Parameters 1: $2"
echo "Parameters 1: $3"
echo "Parameters 1: $4"
echo "Parameters 1: $5"
echo

while [[ "$#" -gt 0 ]]
do
	echo "Number of parameters is ${#}"
	echo "Parameters 1: $1"
	echo "Parameters 1: $2"
	echo "Parameters 1: $3"
	echo
	shift 1
done 
