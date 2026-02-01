#!/bin/bash


Userid=$(id -u)



if [ $Userid -ne 0 ]; then
  {
    echo "Userid is $Userid"
    echo "Please run the script with sudo root access"
    exit 1
  }
fi

echo "Installing Nginx"
dnf install nginx -y

if [ $? -eq 0 ]; then
   
   echo "nginx installation....Success"
else
   echo "nginx installation...Failure"
fi

echo "Installing htop"
dnf install htop -y

if [ $? -eq 0 ]; then
   
   echo "htop installation....Success"
else
   echo "htop installation...Failure"
fi


echo "Installing nodejs"
dnf install nodejs -y

if [ $? -eq 0 ]; then
   
   echo "nodejs installation....Success"
else
   echo "nodejs installation...Failure"
fi