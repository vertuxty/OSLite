#!/bin/bash

path="/home/user"

source=$path"/source"
report_file="backup-report"
path_report=$path/$report_file
if [[ ! -f path_report ]]
then
    touch $path_report
fi

DATA=$(date '+%Y-%m-%d')
backup_dir="Backup-"$DATA
DIR=$path/$backup_dir

diff_date=1
dataF="null"
list=$(ls $path | grep "^Backup-[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}" | sort | tail -n 1)

if [[ ! -z "$list" ]]
then
    dataF=$(echo $list | awk '{print substr($0,8,length($0))}')
    diff_date=$(( ( $(date +%s --date=$DATA) - $(date +%s --date==$dataF) ) - (60*60*24*7) ))
fi

if [[ diff_date -gt 0 ]]
    then
    mkdir $DIR
    cp -rT $source $DIR
    echo "New backup was created: "$backup_dir
    echo "Files: "
    for i in $(find $source -type f)
    do
        echo $i " "
    done
else
    new_dir=$path/$list
    echo "New backup was created: "$list
    echo "Files added:"
    for file in $(find $source -type f)
    do
        file_name=$(basename ${file})
        back_up_file=$new_dir/$file_name
        if [[ ! -f $back_up_file ]]
        then
            cp $file $new_dir
            echo $file " "
        fi
    done
    echo "Change files: "
    for file in $(find $source -type f)
    do
        file_name=$(basename ${file})
        back_up_file=$new_dir/$file_name
        if [[ -f $back_up_file ]]
        then
            sz_old=$(wc -c < $back_up_file)
            sz_new=$(wc -c < $file)
            if [[ ! $sz_old -eq $sz_new ]]
            then
                mv $back_up_file $back_up_file.$DATA
                cp $file $new_dir
                echo $file_name " " $file_name.$DATA
            fi
        fi
    done
fi >> $path_report


