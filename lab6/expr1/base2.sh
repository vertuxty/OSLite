#!/bin/bash

N=$1
value=0
for (( i=1; i <= N; i++ ))
do
	./ev $value &
	((value += 1))
done
wait
