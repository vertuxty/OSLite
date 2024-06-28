#!/bin/bash

id=$1

for (( i=1; i <= id; i++ ))
do
	./writeFile.sh $i
done
