#!/bin/bash


#FUnctions

log(){	
	local VERBOSE="$1"
	shift
	local MESSAGE="$@"
	if [[ "$VERBOSE" == "true" ]]
	then 
		echo "Function log called"
		echo "$MESSAGE"
	fi
	logger -t luser-demo10.sh "${MESSAGE}"
}

backup_file(){
	local FILE="${1}"
	
	if [[ -f "${FILE}" ]]
	then 
		local BACKUP_FILE="/var/tmp/$(basename ${FILE}).$(date +%F-%N)"
		log true "Backing up $FILE to ${BACKUP_FILE} "
		cp -p ${FILE} ${BACKUP_FILE}

	else
		return 1
	fi
	
}
log true "HELLO"
log false "FUNNY"
backup_file "/etc/passwd"

