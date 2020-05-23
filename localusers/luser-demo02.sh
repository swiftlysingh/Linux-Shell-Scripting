#!/bin/bash

#Display the UID and username of the user executing this script
#Display if the user is the root user or not

echo "Your UID is ${UID}"

USER_NAME=$(id -un)
echo "Your username is ${USER_NAME}"

if [[ "${UID}" -eq 0 ]]
then  
 echo "Your are root"
else
 echo "Your are not root"
fi
