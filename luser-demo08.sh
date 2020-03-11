#!/bin/bash

# while , for loops

while [[ "${#}" -ne 0 ]]
do
	echo "cur arg: ${1}"
	shift # it sucks the positional parameter 1 and assigns postional paramter 2's value to param 1
done

echo "You executed $(basename ${0}) in path $(dirname ${0})"
