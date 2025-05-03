# CS561 Final Project
## Performance Study of ACE Bufferpool Manager on Emulated SSDs
## Can Gokmen, Toby Ueno, Tommy Ho
1. Follow the steps to download the FEMU emulator at https://github.com/MoatLab/FEMU
2. When downloading the image files download u20s.qcow2 in the same directory as run-blackbox.sh and replace the contents of run-blackbox.sh with the version provided in our repo.
3. Afterwards you should be able to open the emulated ssd using ./run-blackbox.sh
4. After logging in using the FEMU credentials provided you should be able to download ACE-codebase from the following repo: https://github.com/BU-DiSC/ACE-codebase (you will need to import additional libraries to run experiments properly).
5. You should now be able to cd into ACE-codebase/Simulation where you can run each experiment with its respective eviction policy.
6. It should be noted that in each experiment we are creating a partition on the SSD in order to perform writes directly to it, but this step does not need to be repeated across multiple experiments. Refer to this portion specifically:
      # Inside the FEMU emulator run the following before proceeding with the experiment to create a testfile within the SSD
    sudo parted /dev/nvme0n1 -- mklabel gpt
    sudo parted /dev/nvme0n1 -- mkpart primary ext4 0% 100%
    sudo mkfs.ext4 /dev/nvme0n1p1
    sudo mkdir -p /mnt/myssd
    sudo mount /dev/nvme0n1p1 /mnt/myssd
    
    # Run this portion from within the ACE directory in order to copy the testfile directly into the mounted SSD
    sudo cp testfile3 /mnt/myssd/testfile

