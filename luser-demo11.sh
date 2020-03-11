#!/bin/bash


# get the input from the user using getopts 

usage() {
  echo " ${0} [slv]"
}

PASSWORD_LEN=48

while getopts sl:v OPTIONS
do
  case ${OPTIONS} in
    s) 
        SPECIAL_CHAR='true'
        ;;

    l) 
        PASSWORD_LEN=${OPTARG}
        ;;
    v) 
        VERBOSE='true'
        ;;
    ?)
        usage
        exit 1
  esac
done

if [[ "${VERBOSE}" = 'true' ]]
then
  echo 'generating password'
fi

PASSWORD=$(date +%S-%N | sha256sum | head -c${PASSWORD_LEN})

if [[ "${SPECIAL_CHAR}" = 'true' ]]
then
  SPECIAL_CHARACTER=$(echo '!@#$%^&*()_+-=' | fold -w1 | shuf | head -c1)
  PASSWORD="${PASSWORD}${SPECIAL_CHARACTER}"
fi

echo ${PASSWORD}      
