#!/usr/bin/env bash

ostype=`cat /etc/os-release | head -n 1 | sed 's/NAME="//g;s/"//g'`

if [[ "$ostype" == 'Ubuntu' ]]; then
 echo "############## Installing default soft"
 sudo apt-get update -y
 sudo apt-get install python -y
 sudo apt-get dist-upgrade -y
fi
if [[ "$ostype" == 'CentOS Linux' ]]; then
 sudo yum install python -y
fi