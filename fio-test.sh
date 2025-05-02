#!/bin/bash

for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16; do
        fio --name=write --filename=/dev/nvme2n1 --rw=write --direct=1 --ioengine=libaio --bs=4k --size=1g --iodepth=16 --numjobs=$i --group_reporting
done
