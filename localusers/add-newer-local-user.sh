#!/bin/bash

#Making user with discarding STDERR

if [[ $UID -ne 0 ]]
then 
	echo "========SUDO ONLY========="
	exit 1
fi

if [[ $# -lt 1 ]]
then 
	echo "You nead to provide atleast the USERName."
	echo "Additionally you can also provide any comment as the second argument but in  \" \" "
	exit 1
fi

USERNAME=$1

shift
COMMENT="${@}"

PASSWORD=$(date -sN | sha256sum | head -c8)

FILE="/dev/null"

useradd -m -c "$COMMENT"  $USERNAME &> $FILE

if [[ $? -ne 0 ]]
then 
	echo 'The account could not be created.' >&2
 	exit 1
fi


echo $PASSWORD | passwd --stdin $USERNAME >& /dev/null

if [[ "${?}" -ne 0 ]]
then
  echo 'The password for the account could not be set.' >&2
  exit 1
fi

passwd -e ${USER_NAME} &> /dev/null

echo "username: ${USERNAME}"
echo "password: ${PASSWORD}"
echo "host: ${HOSTNAME}"
exit 0


 
