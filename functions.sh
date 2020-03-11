#!/bin/sh

# Demonstartes a function

log() {
	local MESSAGE="${@}"
	if [[ "${VERBOSE}" = 'true' ]]
	then
		echo "${MESSAGE}"
	fi
	logger -t ${0} 'logging from my script'
}

log 'Hello!'
readonly VERBOSE='true' # makes the VERBOSE constant
log 'This is fun!'

backup_file() {
	# This function creates a backup file.
	local FILE="${1}"
	
	# make sure the file exists
	if [[ -f "${FILE}" ]]
	then
		local BACKUP_FILE="/var/tmp/$(basename ${FILE}).$(date +%F-%N)"
		log "Backing up ${FILE} to  ${BACKUP_FILE} "	
	
		# The exit status of this function will be the exit status of cp command
		cp -p ${FILE} ${BACKUP_FILE} # -p preserves the mode, permissions, last modified time etc..
	else
		echo "The ${FILE} does not exist"
		return 1
	fi

}

backup_file '/etc/passwd'

# Make a decision based on exit status of the function
if [[ "${?}" -eq '0' ]]
then
	log 'File backup succeeded'
else
	log 'File backup failed'
	exit 1
fi

function log_other_way {
	echo 'Just another way to define function' > /dev/null
}

log_other_way
