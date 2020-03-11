#!/bin/bash

# print parameters
echo "${1}"
echo "${2}"
echo "${3}"


# positional parameters
while [[ "${#}" -gt 0 ]] 
do
    echo "param 1 : ${1}"
    echo "param 2 : ${2}"
    echo "param 3 : ${3}"
    shift
done

