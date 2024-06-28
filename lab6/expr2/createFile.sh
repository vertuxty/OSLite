#!/bin/bash

> info/data$1

gcc -std=c99 createFile.c -o crt
./crt "info/data"$1
