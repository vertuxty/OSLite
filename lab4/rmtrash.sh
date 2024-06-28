#!/bin/bash

echo $HOME
trash=$HOME/.trash/
trashLog=$HOME/.trash.log

if [[ $# -ne 1 ]]
     then
         echo "Script must contains one parametr"
         exit 1;
fi

if [[ ! -f $1 ]]
    then
        echo "You should give a file!"
        exit 1;
fi

if [[ ! -d $trash ]]
    then
        mkdir $trash
        echo "Create directory!"
fi

filename=$1
id=1
tmp=$filename$id
path=$(realpath $filename)

while [[ -f $trash$tmp ]]
do
    ((id+=1))
    tmp=$filename$id
done

ln $filename $trash$tmp

echo $filename
rm -f $filename

if [[ ! -f $trashLog ]]
    then
        touch $trashLog
        echo "Create trash_log"
fi

echo $path $tmp >> $trashLog










