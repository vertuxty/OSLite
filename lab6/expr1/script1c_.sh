#!/bin/bash

>res.log

./compile_script.sh
for (( N=1; N<=20; N++))
do
	echo $N >> res.log
	for (( i=1; i <= 10; i++ ))
	do
	 	{ /usr/bin/time -f "%E" ./base1.sh $N ; } 2>> res.log 
	done	
done
