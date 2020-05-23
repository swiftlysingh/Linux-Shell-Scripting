#!/bin/bash

#Display the UID and username of the user executing this script 
#DIsplay if the user is the vagrant or not.

echo "${UID}"

UID_To_Test_For='1000'


if [[ "${UID}" -ne "${UID_To_Test_For}" ]]
then 
 echo "Your UID does not match ${UID_To_Test_For}"
 echo 1
fi


USER_NAME=$(id -un)

if [[ "${?}" -ne 0 ]]
then 
 echo 'The id command did not execute successfully'
 exit 1

fi

echo "Your username is ${USER_NAME}"

USER_NAME_TO_TEST_FOR='vagrant'
if [[ "${USER_NAME}" = "${USER_NAME_TO_TEST_FOR}" ]]
then 
 echo "Your username matches ${USER_NAME_TO_TEST_FOR}."
fi


if [[ "$USER_NAME" != "${USER_NAME_TO_TEST_FOR}" ]]
then 
  echo "Your username matches ${USER_NAME_TO_TEST_FOR}."
  exit 1
fi

exit 0

if [[ "$USER_NAME" != "${USER_NAME_TO_TEST_FOR}" ]]
then
  echo "Your username matches ${USER_NAME_TO_TEST_FOR}.Again!"
  exit 1
fi
