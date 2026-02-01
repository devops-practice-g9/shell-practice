#!/bin/bash

set -e

echo "Running as UID: $(id -u)"
whoami


R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
Userid=$(id -u)
LOG_FOLDER="/var/log/shell-script"
LOG_File="/var/log/shell-script/$0.log"

echo "Install package Manually"

dnf install ggggg -y
echo "This will not execute"

if [ $Userid -ne 0 ];then
       
       echo -e "$R please run the script with root user access" 
       exit 1
   fi

mkdir -p $LOG_FOLDER

VALIDATE() {
    if [ $? -ne 0 ]; then
   echo -e "$R $2...Failure" | tee -a $LOG_File
   
else
   echo -e "$G $2....Success" | tee -a $LOG_File
   fi
}
    
for package in $@
  do 
     dnf list installed $package &>>$LOG_File
     if [ $? -ne 0 ]; then
     echo -e "$Y $package not installed ,installing now"
     dnf install $package -y &>>$LOG_File
     VALIDATE $? "$package Installation"
    else
      echo -e "$G $package already installed ,skipping"
      fi
  done
