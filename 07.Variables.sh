#!/bin/bash

echo "Variables passed to the Script: $@"
echo "Number of Variables passed to the Script: $#"
echo "Script Name: $0"
echo "Taking all arguments as one: $*"
echo "who is running the script: $USER"
echo "Home Directory of the user: $HOME"
echo "PID of the Script: $$"
sleep 40
echo "Background process ID: $!"
echo "Present working Directory: $PWD"