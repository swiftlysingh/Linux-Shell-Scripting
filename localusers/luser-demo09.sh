#! /bin/bash

# Demo of Case Statement

case "$1" in
 start)
  echo "Starting"
  ;;
 stop)
  echo "Stopping" 
  ;;
 status|state|--status|-s)
  echo "Status: "
  ;;
 *)
  echo "Supply a valid option" >&2
  exit 1
esac
