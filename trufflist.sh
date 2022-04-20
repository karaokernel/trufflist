#!/usr/bin/env bash
myarray=(`cat $1`)
noofelements=${#myarray[*]}
#now traverse the array
counter=0
while [ $counter -lt $noofelements ]
do
    echo " Element $counter is  ${myarray[$counter]}" >> report.txt
    /home/kali/apps/trufflehog/trufflehog $2 github --org=${myarray[$counter]} >> report.txt
    counter=$(( $counter + 1 ))

done
