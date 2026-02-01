#!/bin/bash

Userid=$(id -u)

LOG_DIR=/var/log/Shell_Script
LOG_FILE=/var/log/Shell_Script/$0.log

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"

if [ $Userid -ne 0 ]; then
  {
    echo -e "$G Userid is $Userid"
    echo -e "$R Please run the script with sudo root access" | tee -a $LOG_FILE
    exit 1
  }
fi

mkdir -p /var/log/Shell_Script

VALIDATE() {
   if [ $? -eq 0 ]; then
      echo -e "$G $2....Success"
    else
      echo -e "$R $2...Failure"
fi
}

for package in $@
do 
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]; then
       echo -e "$R Software $package was not yet installed" 
       dnf install $package -y &>>$LOG_FILE
       VALIDATE $? "installing software $package"
else
      echo -e "$Y Software $package was already installed" 
    fi
done