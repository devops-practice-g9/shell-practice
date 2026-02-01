#!/bin/bash

#!/bin/bash


Userid=$(id -u)

if [ $Userid -ne 0 ]; then
  {
    echo "Userid is $Userid"
    echo "Please run the script with sudo root access"
    exit 1
  }
fi

VALIDATE() {
   if [ $? -eq 0 ]; then
      echo "$2....Success"
    else
      echo "$2...Failure"
fi
}


dnf install nginx -y
VALIDATE $? "Installing Nginx"


