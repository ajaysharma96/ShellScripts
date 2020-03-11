#!/bin/bash

# This is a script to demo positional parameters and for loop

# Print the number of args in cmd line
echo "You entered ${#} args."

# Print args in loop
for args in ${@}
do
	echo "Hello ${args}."
done


