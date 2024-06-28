#!/bin/bash

gcc -std=c99 writeFile.c -o wrt
./wrt "info/data"$1
