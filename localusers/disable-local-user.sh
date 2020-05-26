#!/bin/bash

# This script will disable, delete and/or archive a user on the local system

usage(){
	
echo "Usage: ${0} [-dra] USER [USERN]..." >&2
  echo 'Disable a local Linux account.' >&2
  echo '  -d  Deletes accounts instead of disabling them.' >&2
  echo '  -r  Removes the home directory associated with the account(s).' >&2
  echo '  -a  Creates an archive of the home directory associated with the account(s).' >&2
  exit 1

}

if [[ "$UID" -ne 0 ]]
then
	echo "SUDO ONLY"
	exit 1
fi

while getopts dra OPTION
do
	case $OPTION in 
		d) DELETE_USER="true";;
		r) REMOVE_HOME="-r" ;;
		a) ARCHIVE="true" ;;
		?) usage;;
	esac
done

shift "$(( OPTIND - 1 ))"

if [[ "${#}" -lt 1 ]]
then
  usage
fi

for USERNAME in "${@}"
do
  echo "Processing user: ${USERNAME}"
done

USERID=$(id -u ${USERNAME})
if [[ "${USERID}" -lt 1000 ]]
then
   echo "Refusing to remove the ${USERNAME} account with UID ${USERID}." >&2
   exit 1
fi

userdel $USERNAME

echo "DONE"
exit 0
