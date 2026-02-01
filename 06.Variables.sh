#!/bin/bash

Start_Time=$(date +%s)

sleep 30

End_Time=$(date +%s)



Total=$(($Start_Time-$End_Time))

echo "Total time is $Total"