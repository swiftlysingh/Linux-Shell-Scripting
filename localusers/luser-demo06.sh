#!/bin/bash
# This scriipt generates a random password for each user specified on the command line


echo "You executed this command: ${0}"
echo "You used $(dirname ${0}) as the path to the $(basename ${0}) script"

NUMBR="${#}"

echo "You supplied ${NUMBR} arguments on the command line "


if [[ "${NUMBR}" -lt 1 ]]
then 
	echo "USAGE: ${0} USER_NAME [USERNAME]..."
	exit 1

fi

for USER_NAME in "$@"
do 
	PASSWORD=$(date +%s%N | sha256sum | head -c48)
	echo "$USER_NAME : $PASSWORD"

done
