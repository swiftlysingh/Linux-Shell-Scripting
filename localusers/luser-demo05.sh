#!/bin/bash

#This script generates list of random password

PASSWORD="${RANDOM}"
echo "${PASSWORD}"


PASSWORD="${RANDOM}${RANDOM}${RANDOM}"
echo "${PASSWORD}"

PASSWORD=$(date +%s)
echo "${PASSWORD}"



PASSWORD=$(date +%s%N)
echo "${PASSWORD}"


PASSWORD=$(date +%s%N | sha256sum | head -c8)
echo "${PASSWORD}"

PASSWORD="$(date +%s%N | sha256sum | head -c8)$(echo '~!@#$%^&*()_+-='|fold -w1 | shuf | head -c2)"
echo "${PASSWORD}"
