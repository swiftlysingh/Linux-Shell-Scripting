#!/bin/bash

# Deleting a user acount


if [[ $UID -ne 0 ]]
then 
	echo "SUDO ONLY"
	exit 1
fi

USER="$1"

userdel $USER

if [[ $? -ne 0 ]]
then
	echo "FAILED"
	exit 1
fi

echo "DELETE ACCOUNT $USER"
exit 0
