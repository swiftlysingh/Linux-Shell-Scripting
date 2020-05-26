#!/bin/bash

# THis script prints all the open ports 


netstat -nutl$1 | grep  ":" | awk '{print $4}' | awk -F ':' '{print $NF}' 
