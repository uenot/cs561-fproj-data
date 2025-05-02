#!/bin/sh

# After following instructions on how to install FEMU, change the number of channels in your script to your desired value

# Inside the FEMU emulator run the following before proceeding with the experiment to create a testfile within the SSD
sudo parted /dev/nvme0n1 -- mklabel gpt
sudo parted /dev/nvme0n1 -- mkpart primary ext4 0% 100%
sudo mkfs.ext4 /dev/nvme0n1p1
sudo mkdir -p /mnt/myssd
sudo mount /dev/nvme0n1p1 /mnt/myssd

# Run this portion from within the ACE directory in order to copy the testfile directly into the mounted SSD
sudo cp testfile3 /mnt/myssd/testfile

# This next portion is the actual experiment it should be run within each policy folder


# ACE is off
x=100000
f="/mnt/myssd/testfile"
a=1
b=15
sudo ./buffermanager -b $b -f $f -x $x -a $a >> workload1.txt
done

# ACE is on
x=100000
f="/mnt/myssd/testfile"
a=5
b=15
for k in {1,2,4,8,16,32,64}; do
  sudo ./buffermanager -b $b -f $f -x $x -a $a -k $k >> workload1.txt
done