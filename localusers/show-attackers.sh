#!/bin/bash

# Count the number of failed logiin attempts by IP

if [[ $# -lt 1 ]]
then 
	echo "Attleast ONE ARG REQUIIRED"
	exit 1
fi
LOG_FILE="$1"

if [[ ! -e "${LOG_FILE}" ]]
then 
  echo "Cannot open log file: ${LOG_FILE}" >&2
  exit 1
fi

echo 'Count,IP,Location'

grep Failed ${LOG_FILE} | awk '{print $(NF - 3)}' | sort | uniq -c | sort -nr |  while read COUNT IP
do
  if [[ "${COUNT}" -gt "${LIMIT}" ]]
  then
    LOCATION=$(geoiplookup ${IP} | awk -F ', ' '{print $2}')
    echo "${COUNT},${IP},${LOCATION}"
  fi
done
exit 0
 
