#!/bin/bash

trash=$HOME/.trash
trashLog=$HOME/.trash.log

if [[ $# -ne 1 ]]
    then
        echo "Script must have one arg!"
        exit 1
fi

filename=$1

if [[ ! -d $trash ]]
    then
        echo "Directory .trash is not found!"
        mkdir $trash
        exit 1
fi

if [[ ! -f $trashLog ]]
    then
        echo "File .trash.log is not found!"
        mkdir $trashLog
        exit 1
fi

line=""
dir_path=""
new_name=$filename
count=0
while read -r query
do
    echo $query
    match=$(awk -F " " '{print $1}' <<< "$query" | grep "/${filename}$")
    if [[ -z $match ]]
        then
            continue
    fi
    name=$(echo $query | awk '{print substr($0, length($1) + 2)}')
    echo $name "NAME"
    read -p "Do you wanna untrash"${match}" (Y/N): " ansYN <&1;
    if [[ $ansYN == "Y" ]]
        then
            ((count+=1))
            catalog=$(echo $query | awk '{print substr($0, 0, length($1) - length($2) + 1)}')
            if [[ ! -d $catalog ]]
                then
                    echo "Catalog: <" $catalog "> is not created"
                    catalog=$HOME/
            fi

            while [[ -f $catalog$new_name ]]
            do
                read -p "File already exist in this dir, please rename file!: " new_name <&1
                echo "check: " $new_name
            done
            echo $catalog $new_name
            if [[ ! -f $trash/$name ]]
                then
                    ((count-=1))
                    echo "No such file in .trash dir!"
                    continue
            fi
            ln $trash/$name $catalog$new_name
            rm -v $trash/$name
            continue
    fi
done <<< $(cat $trashLog)

if [[ count -eq 0 ]]
    then
        echo "You didn't choose anything. Program is end!"
fi














