#!/bin/bash

filename=$1
dircopy=$2

rsync -zvh --partial --append --progress $filename $dircopy
