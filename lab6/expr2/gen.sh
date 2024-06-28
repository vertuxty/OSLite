#!/bin/bash

N=$1

for (( i=1; i <= N + 1; i++ ))
do 
	./createFile.sh $i
done
