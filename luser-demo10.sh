#!/bin/bash

# I/0 redirection

# redirect a STDOUT to a file
FILE="/tmp/data"
echo "One line entered" > ${FILE}

# redirect STDIN
read LINE < ${FILE}
echo "${LINE}"

# redirect STDIN to a program using fd 0
read LINE  0< ${FILE}
echo
echo "File contains ${LINE}"

# redirect STOUT to a file using fd 1
head -n3 /etc/passwd 1> ${FILE}
echo
echo "Contents of the file ${FILE}"
cat ${FILE}

# redirect the STDERR to file using fd 2
ERR_FILE="/tmp/data.err"
cat /fakefile 2> ${ERR_FILE}
echo
echo "Contents of ${ERR_FILE}"
cat ${ERR_FILE}

# redirect STDERR and STDOUT to a file

#old method
BOTH_ERR="/tmp/both.err"
head -n4 /etc/passwd /fakefile >  ${BOTH_ERR} 2>&1
echo
echo "Contents of ${BOTH_ERR} using old method"
cat ${BOTH_ERR}

# new method
head -n5 /etc/passwd /fakefile &> ${BOTH_ERR}
echo
echo "Contents of ${BOTH_ERR} using new method"
cat ${BOTH_ERR}

# redirect STDERR and STDOUT through a PIPE
#head -n4 /etc/passwd /fakefile |&  cat -n

# send output to STDERR
echo "error" | >&2

# discard STDOUT
echo
echo "Discarding STDOUT"
head -n4 /etc/passwd /fakefile  > /dev/null

# discard STDERR
echo
echo "Discarding STRERR"
head -n4 /etc/passwd /fakefile 2> /dev/null

# discard both STDERR and STDOUT
echo
echo "Discarding both STDERR and STDOUT"
head -n4 /etc/passwd /fakefile &> /dev/null

rm ${FILE} ${BOTH_ERR} ${ERR_FILE} &> /dev/null
