#!/bin/bash

# This sscript demonstrates case statement

#if [[ "${1}" = 'starting' ]]
#then
#	echo "starting.."
#elif [[ "${1}" = 'stop' ]]
#then
#	echo "stopping"
#elif [[ "${1}" = 'status' ]]
#then
#	echo "status"
#else
#	echo "Supply a valid option" >&2
#	exit 1
#fi


case "${1}" in
	start)
	echo "starting.."
	;;

	stop)
	echo "stopping.."
	;;
	
	status|state|--status|--state)
	echo "status"
	;;
	
	*)
	echo "Enter a valid option" >&2
	exit 1
	;;
esac

