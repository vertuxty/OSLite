#!/bin/bash
name="par"$1
>$name
for (( i=1; i<=20; i++ ))
do	
	echo $i >> $name
	./gen.sh $i
	for (( j=1; j <= 10; j++ ))
	do
		{ /usr/bin/time -f "%E" ./base2.sh $i ; } 2>> $name
	done
done
