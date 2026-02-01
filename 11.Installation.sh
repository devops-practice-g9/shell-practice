#!/bin/bash

package=$1
Userid=$(id -u)



if [ $Userid -ne 0 ]; then
  {
    echo "Userid is $Userid"
    echo "Please run the script with sudo root access"
    exit 1
  }
fi

dnf install $package -y