#!/bin/bash

if [[ "$UID" -ne 0 ]]
then 
	echo "RUN WITH SUDO"
	exit 1
fi

if [[ "$#" -lt 1 ]]
then 
 echo "SUPPPLY USERNAME"
 exit 1
fi

USER_NAME="$1"
PASSWORD="$(date +%s%N | sha256sum | head -c48)"

useradd -m $USER_NAME

if [[ "${?}" -ne 0 ]]
then 
 echo "ERROR ACCOUNT NOT CREATED" 
 exit 1
fi


echo $PASSWORD | passwd --stdin ${USER_NAME}

if [[ "${?}" -ne 0 ]]
then
  echo "The password for the account could not be set."
  exit 1
fi

passwd -e ${USER_NAME}



echo
echo "username ${USER_NAME}"
echo
echo "password ${PASSWORD}"
exit 0

