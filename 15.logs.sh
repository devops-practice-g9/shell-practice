#!/bin/bash

Userid=$(id -u)
LOG_DIR=/var/log/Shell_Script
LOG_FILE=/var/log/Shell_Script/$0.log

if [ $Userid -ne 0 ]; then
  {
    echo "Userid is $Userid"
    echo "Please run the script with sudo root access" | tee -a $LOG_FILE
    exit 1
  }
fi

mkdir -p $LOG_DIR

VALIDATE() {
   if [ $? -eq 0 ]; then
      echo "$2....Success"
    else
      echo "$2...Failure"
fi
}


dnf install nginx -y &>> $LOG_FILE
VALIDATE $? "Installing Nginx"

dnf install htop -y  &>> $LOG_FILE
VALIDATE $? "Installing htop"

dnf install nodejs -y &>> $LOG_FILE
VALIDATE $? "Installing nodejs"