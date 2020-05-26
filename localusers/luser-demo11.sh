#!/bin/bash

# Generate a PAssword with options

usage(){
  echo "Usage: ${0} [-vs][-l LENGTH]" >&2
  echo "GENERATE a random password"
  exit 1
}

log(){
 local MESSAGE="${@}"
 if [[ "$VERBOSE" = "true" ]]
 then
        echo "$MESSAGE"
 fi
}
LENGTH=48

while getopts vl:s OPTION
do 
 case $OPTION in 
  v)
   VERBOSE="true"
   echo "VERBOSE on"
  ;;
  l)
   LENGTH="$OPTARG"
   ;;
  s)
    USE_SPECIAL_CHAR="true" 
    ;;
  ?)
    usage
    ;;
  esac
done

echo "NUMBER OF ARGS: ${#}"
echo "ALL ARGS $@"

log "GENERATING A PASS"

PASSWORD=$(date +%s%N$RANDOM$RANDOM | sha256sum | head -c$LENGTH)


log "DONE"
echo $PASSWORD
exit 0 
