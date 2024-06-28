#!/bin/bash

path="/home/user"
restore=$path/"restore"

name_dir=$(ls $path | grep "^Backup-[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}" | sort -r | head -n 1)

if [[ -z "$name_dir" ]]
then
    echo "Backups not found. Exit"
    exit 0
fi

if [[ -d $restore ]]
then
  echo "Old restored files was delited."
  rm -Rf $restore
fi

mkdir $restore

backup_path=$path/$name_dir
regexp='[0-9]{4}-[0-9]{2}-[0-9]{2}'


#Условие не понятно (чуть чуть). Как я понял мы ищем самую последнюю директорию бэкапа
#И хотим от туда скопировать в restore все файлы (без старых версий, т.е. без даты в названии)

for file in $(find $backup_path -type f)
do
    name=$(echo $file | awk '{print substr($0, 30)}')
    if [[ ! $name =~ .${regexp}$ ]]
    then
        cp $file $restore
    fi
done






