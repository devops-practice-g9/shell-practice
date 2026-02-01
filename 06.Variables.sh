#!/bin/bash

Start_Time=$(date +%s)

sleep 30

End_Time=$(date +%s)



Total=$(($End_Time-$Start_Time))

echo "Total time for execution is $Total"