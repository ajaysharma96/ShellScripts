#!/bin/bash

echo "Your user id is ${UID}"

USER_ID=$(id -un)

echo "Your user name is ${USER_ID}"

if [[ ${UID} -eq 0 ]]
then
	echo "You are root"
else
	echo "You are NOT root"
fi
