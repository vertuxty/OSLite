#!/bin/bash
declare -a arr
count=0
while [[ ! ${#arr[@]} -gt $1 ]]
do
    # echo ${#arr[@]}
    arr+=(1 2 3 4 5 6 7 8 9 10)
done

