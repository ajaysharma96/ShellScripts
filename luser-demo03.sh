#!/bin/bash

#Display the UID and user name of the user executing this script

# Display the UID
echo "You are user ${UID}"

# Only display the UID if it does not match 1642890915
UID_TO_TEST_FOR='1642890915'

if [[ "${UID}" -ne "${UID_TO_TEST_FOR}" ]]
then
	echo "Your UID does not match ${UID_TO_TEST_FOR}"
	exit 1
fi

# Display the user name
USER_NAME=$(id -un)

# Test if the last command succeded
if [[ "${?}" -ne 0 ]]
then
	echo "The id command did not execute successfully"
	exit 1
fi
echo "Your user name is ${USER_NAME}"

# Test a string equality
USER_NAME_TO_TEST='aajash'

if [[ "${USER_NAME}" = "${USER_NAME_TO_TEST}" ]]
then
	echo "Your user name matches ${USER_NAME_TO_TEST}"
fi

# Test for != for a string
if [[ "${USER_NAME}" != "${USER_NAME_TO_TEST}" ]]
then
	echo "Your user name does not match ${USER_NAME_TO_TEST}."
	exit 1
fi

exit 0

