#!/bin/bash

# This script generates a random password.
# This user can set the passwoed length with a -l and add a special character with -s.
# Verbose mode can be enabled with -v


usage() {
	echo "Usage: ${0} [-vs] [-l LENGTH]" >&2
	echo 'Generate a random password'
	echo ' -l LENGTH  Specify the password length'
	echo ' -s          Append a special character to the password'
	echo ' -v          Increase the Verbosity'
	exit 1

}

log() {
	local MESSAGE="${@}"
	if [[ "${VERBOSE}" = 'true' ]]
	then
		echo "${MESSAGE}"
	fi
}

# Set a default password length
LENGTH=48

while getopts vl:s OPTION # : is used to specify that -l option needs to be followed by an mandatory arg.
do
	case ${OPTION} in
		v)
			VERBOSE='true'
			log 'Verbose mode on'
			;;
		l)
			LENGTH="${OPTARG}"  # The argument supplied for an option is placed in OPTARG by shell
			;;
		s)
			USE_SPECIAL_CHARACTER='true'
			;;
		?)
			usage 
			;;	
	esac
done

log 'Generating a password'

PASSWORD=$(date +%s%N${RANDOM}${RANDOM} | sha256sum | head -c${LENGTH})

# Append a special character if requested to do so 
if [[ "${USE_SPECIAL_CHARACTER}" = 'true' ]]
then
	log 'Selecting a random special character.'
	SPECIAL_CHARACTER=$(echo '!@#$%^&*()_+' | fold -w1 | shuf | head -c1)
	PASSWORD="${PASSWORD}${SPECIAL_CHARACTER}"
fi

# Display the password
echo "Password is ${PASSWORD}"

exit 0
