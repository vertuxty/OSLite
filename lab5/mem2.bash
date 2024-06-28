#!/bin/bash
> report2.log
declare -a arr
count=0
while [[ true ]]
do
    arr+=(1 2 3 4 5 6 7 8 9 10)
    ((count+=1))
    if [[ count -eq 100000 ]]
    then
        echo ${#arr[@]} >> report2.log
        count=0
    fi
done