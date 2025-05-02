#!/bin/bash

script_path=$(dirname "$0")
binary_path="$script_path/buffermanager"
testfile_path="$script_path/testfile3"

for i in 0 5 10 15 20 25 30 35 40 45 50 55 60 65 70 75 80 85 90 95 100
do
        cp "$testfile_path" /mnt/myssd/testfile
        "$binary_path" -f /mnt/myssd/testfile -b 15 -x 100000 -a 1 -k 2 -e $i
        cp "$testfile_path" /mnt/myssd/testfile
        "$binary_path" -f /mnt/myssd/testfile -b 15 -x 100000 -a 5 -k 2 -e $i
done
