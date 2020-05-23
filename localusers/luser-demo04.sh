#!/bin/bash

#This script creates an account on the local system
#You will be prompted for the acoount name and password

read -p "Enter username: " USER_NAME
read -p "Enter Name of the user: " COMMENT
read -p "Enter password to be used: " PASSWORD

useradd -c "${COMMENT}" -m ${USER_NAME}
echo ${PASSWORD} | passwd --stdin ${USER_NAME}

passwd -e ${USER_NAME}
