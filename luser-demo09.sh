#!/bin/bash

for param in "${@}"
do
	echo "${param}"
done

for param in "${*}"
do
	echo " ${param}"
done

sleep 20
