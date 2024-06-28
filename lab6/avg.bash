#!/bin/bash


fl=$1
name_wr="avg"$2
sum=0
re='^[0-9]+$'
>$name_wr
while read -r line
do
    if [[ $line =~ $re ]]
    then
        sum=$(bc <<< "scale=2; $sum / 10")
        echo $sum
        echo $sum >> $name_wr
        echo $line >> $name_wr
        ((sum=0))
        continue
    fi
    tmp=$(cut -c 3-7 <<< $line)
    next_char=$(cut -c 1 <<< $tmp)
    if [[ $next_char -eq 0 ]]
    then
        tmp=$(cut -c 4-7 <<< $line)
    fi
    sum=$(echo "$sum + $tmp" | bc)
    # echo $sum 
done < $fl 

sum=$(bc <<< "scale=2; $sum / 10")
echo $sum >> $name_wr
