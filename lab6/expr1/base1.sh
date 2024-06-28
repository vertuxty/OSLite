#!/bin/bash

N=$1
value=0
for (( i=1; i <= N; i++ ))
do
	((value += 1))
	./ev $value
done
