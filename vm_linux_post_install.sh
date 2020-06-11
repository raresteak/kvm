#!/bin/bash

# Add noatime to ext file systems in fstab
cp /etc/fstab /etc/fstab.bak1
awk '!/^#/ && ($3 ~ /ext/) { if(!match(/noatime/, $4)) $4=$4",noatime" } 1' /etc/fstab.bak1 > /etc/fstab 

# Display IP at console login prompt
echo "IP: \4{enp0s3}" >> /etc/issue

# Update motd with build date
echo "Installed: $(date)" >> /etc/motd

# Tune for less swapping
echo "vm.swappiness=1" >> /etc/sysctl.conf
