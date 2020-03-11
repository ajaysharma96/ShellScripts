#!/bin/bash

if [[ ${UID} -ne 0 ]]
then
	echo "You are not executing as root" >&2
	exit 1
fi

if [[ ${#} -lt 1 ]]
then
	echo "You need to provie at leaset one input"
fi

