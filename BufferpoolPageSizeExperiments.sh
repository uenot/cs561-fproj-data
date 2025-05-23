#!/bin/sh

# Should be run within each policy folder
# Important to note that for consistent results set -n parameter to a specific value such as 22 specific once the disk page size is large enough

# Testing with ACE
x=100000
f="/mnt/myssd/testfile"
a=5
k=8
n=22
for b in {1..30}; do
  sudo ./buffermanager -b $b -n $n -f $f -x $x -a $a -k $k >> workload1.txt
done

#Testing without ACE
a = 1
for b in {1..30}; do
  sudo ./buffermanager -b $b -n $n -f $f -x $x -a $a -k $k >> workload2.txt
done

