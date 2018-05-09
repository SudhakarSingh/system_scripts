#!/bin/bash

#This script takes logical volume name, size and mount point details from user and creates and mounts the LV. /etc/fstab entry is also added automatically.
# Author : Sudhakar Singh: sudhakar.singh@orange.com [Version 1]

echo "Enter the logical volume name: "; 
read lvname;
echo "Enter the logical volume size in GB: ";
read lvsize;
lvsize=`echo $lvsize`G;
lvcreate -n $lvname -L $lvsize /dev/infravg;
mkfs.ext4 /dev/infravg/$lvname;
echo "The logical volume /dev/infravg/$lvname has been created";
echo "Enter the mount point: ";
read mountpoint;
mkdir -p $mountpoint;
echo "/dev/infravg/$lvname $mountpoint ext4 defaults 0 0" >> /etc/fstab;
mount -a;
grep $mountpoint /etc/fstab;
df -h $mountpoint;
