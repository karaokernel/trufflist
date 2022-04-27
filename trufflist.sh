#!/usr/bin/env bash

#check number of arguments
if [ "$#" -ne 2 ] 
then
    echo "Usage is ./trufflehog [--only-verified] <output_file.txt> <list_to_scan.txt>"
fi
#go to the last argument and echo it
for last; do true; done
echo "List to scan: ${@: -1}"
#save file with name $last in myarray
myarray=(`cat $last`)
noofelements=${#myarray[*]}
#output arguments selected 
echo "Output file: ${@: -2:1}"
#traverse the array

if [ "$1" == "--only-verified" ]
    then
        echo "Only verified data"
        counter=0
        while [ $counter -lt $noofelements ]
        do
            echo " Element $counter is  ${myarray[$counter]}" >> ${@: -2:1}
            ./trufflehog --only-verified github --org=${myarray[$counter]} >> ${@: -2:1}
            counter=$(( $counter + 1 ))
        done
    else
        echo "All data (not only verified)"
        counter=0
        while [ $counter -lt $noofelements ]
        do
            echo " Element $counter is  ${myarray[$counter]}" >> ${@: -2:1}
            ./trufflehog github --org=${myarray[$counter]} >> ${@: -2:1}
            counter=$(( $counter + 1 ))
        done
    fi


#last ${@: -2:1}
#second to last ${@: -1}