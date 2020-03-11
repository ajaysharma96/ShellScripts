#!/bin/bash

# This script generates a list of random passwords

# Generate a random password
PASSWORD="${RANDOM}"
echo "Random number is ${PASSWORD}"

# Three random numbers together
PASSWORD="${RANDOM}${RANDOM}${RANDOM}"
echo "Random password is ${PASSWORD}"

# Use the current date as password
PASSWORD=$(date +%s)
echo "Password is ${PASSWORD}"
