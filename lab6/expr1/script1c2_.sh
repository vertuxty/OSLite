#!/bin/bash

>res2.log

./compile_script.sh
for (( N=1; N<=20; N++))
do
	echo $N >> res2.log
	for (( i=1; i <= 10; i++ ))
	do
	 	{ /usr/bin/time -f "%E" ./base2.sh $N ; } 2>> res2.log 
	done
done
