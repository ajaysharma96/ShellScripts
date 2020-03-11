#!/bin/bash

if [[ "${UID}" -ne 0 ]]
then
	echo "Please execute as root"  >&2
	exit 1
fi

if [[ "${#}" -lt 1 ]]
then
	echo "Usage : ${0} USER_NAME [COMMENT]..."  >&2
	echo "Create a local user with USER_NAME and COMMENT field"
	exit 1
fi

# The first parameter is the user name 
USER_NAME="${1}"

# The rest of the parameters are account comment
shift
COMMENT="${@}"

# Generate a password
PASSWORD=$(date +%s%N | sha256sum | head -c48)

# Create a user with a password
useradd -c "${COMMENT}" -m ${USER_NAME}  &>2

# Check to see the exit status
if [[ "${?}" -ne 0 ]]
then
	echo "The account could not be created"  >&2  
	exit 1
fi

# set the passwd
echo ${PASSWORD} | passwd --stdin ${USER_NAME} &> /dev/null  


# Check to see if the command succeeded
if [[ "${?}" -ne 0 ]]
then
	echo "Failed to set password" >&2
	exit 1
fi

# Force password change on firt login
passwd -e ${USER_NAME}  &> /dev/null

