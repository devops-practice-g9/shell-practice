#!/bin/bash

Userid=$(id -u)

if [ $Userid -ne 0 ]; then

     echo "Userid is $Userid is Normal user"
 else
     echo "Userid is $Userid is Root user"
fi