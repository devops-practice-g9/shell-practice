#!/bin/bash

Userid=$(id -u)

LOG_DIR=/var/log/Shell_Script
LOG_FILE=/var/log/Shell_Script/$0.log

if [ $Userid -ne 0 ]; then
  {
    echo "Userid is $Userid"
    echo "Please run the script with sudo root access" | tee -a 
    exit 1
  }
fi

mkdir -p /var/log/Shell_Script

VALIDATE() {
   if [ $? -eq 0 ]; then
      echo "$2....Success"
    else
      echo "$2...Failure"
fi
}

for package in $@
do 
    dnf list installed $package 
    if [ $? -ne 0]; then
       echo "Software $package was not yet installed" 
       dnf install $package -y
       VALIDATE $? installing $package
else
      echo "Software $package was already installed" 
    fi
done