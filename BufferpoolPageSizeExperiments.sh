#!/bin/sh

# Inside the FEMU emulator run the following before proceeding with the experiment to create a testfile within the SSD
sudo parted /dev/nvme0n1 -- mklabel gpt
sudo parted /dev/nvme0n1 -- mkpart primary ext4 0% 100%
sudo mkfs.ext4 /dev/nvme0n1p1
sudo mkdir -p /mnt/myssd
sudo mount /dev/nvme0n1p1 /mnt/myssd

# Run this portion from within the ACE directory in order to copy the testfile directly into the mounted SSD
sudo cp testfile3 /mnt/myssd/testfile

# This next portion is the actual experiment it should be run within each policy folder
# Important to note that for consistent results set -n parameter to a specific value such as 22 specific once the disk page size is large enough

# Testing with ACE
x=100000
f="/mnt/myssd/testfile"
a=5
k=8
for b in {1..30}; do
  sudo ./buffermanager -b $b -f $f -x $x -a $a -k $k >> workload1.txt
done

#Testing without ACE
a = 1
for b in {1..30}; do
  sudo ./buffermanager -b $b -f $f -x $x -a $a -k $k >> workload2.txt
done

