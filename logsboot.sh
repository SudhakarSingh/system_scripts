##!/bin/sh
# script to gather some key information on Linux system 
# THIS IS MANDATORY TO RUN THIS SCRIPT BEFORE EVERY REBOOT
######
#

DATE=`date '+%Y%m%d-%H%M'`
SERVER=`uname -n`
echo -e "Linux PreCheck Script Mini"
LOG=/tmp/${SERVER}_restart_check${DATE}.log
echo -e "Logfile is $LOG"
echo -e "This is the system information for $SERVER run at `date`" >> $LOG
/bin/uname -a >> $LOG
/usr/bin/uptime >> $LOG

echo -e "================================================================================\n" >> $LOG

echo "========mtab========\n" >> $LOG
cat /etc/mtab >> $LOG
echo "=======fstab======\n" >> $LOG
cat /etc/fstab >> $LOG
echo "=======hostname======\n" >> $LOG
hostname >> $LOG
echo "=======df output======\n" >> $LOG
df -Th >> $LOG
echo "=======routes======\n" >> $LOG
route -n >> $LOG
echo "=======NIC info======\n" >> $LOG
ifconfig -a >> $LOG
echo "=======kernel======\n" >> $LOG
uname -a >> $LOG
echo "======uptime=====\n" >> $LOG
uptime >> $LOG
echo "=======resolv.conf======\n" >> $LOG
cat /etc/resolv.conf >> $LOG
echo "=======network configs=======\n" >> $LOG
cat /etc/sysconfig/network-scripts/ifcfg-* >> $LOG
echo "=======persistent route file=======\n" >> $LOG
cat /etc/sysconfig/network-scripts/route* >> $LOG
echo "=======hosts file=======\n" >> $LOG
cat /etc/hosts >> $LOG
echo "=======/etc/sysconfig/network======\n" >> $LOG
cat /etc/sysconfig/network >> $LOG
echo "==========PVS/LV/VG======\n" >> $LOG
pvs >> $LOG
lvs >> $LOG
vgs >> $LOG
echo "========passwd file======\n" >> $LOG
cat /etc/passwd >> $LOG
echo "======shadow file=====\n" >> $LOG
cat /etc/shadow >> $LOG
echo "========sudoers=======\n" >> $LOG
cat /etc/sudoers >> $LOG
echo "=======ssh config=====\n" >> $LOG
cat /etc/ssh/sshd_config >> $LOG
