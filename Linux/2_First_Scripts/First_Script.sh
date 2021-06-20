#!/bin/bash

echo "First Script - System Audit"
# Easy first script; system audit for Ubuntu

date
# Current date

echo ""
# \n

echo "Machine Type Info:"

echo $MACHTYPE

echo -e "Uname info: $(uname -a) \n"

echo -e "IP Info: $(ip addr | grep inet | tail -2 | head -1) \n"

echo "Hostname: $(hostname -s) "

echo "DNS Servers: "

cat /etc/resolv.conf
# Display DNS info

echo "Memory Info:"

free

echo -e "\nCPU Info:"

lscpu | grep CPU

echo -e "\nDisk Usage:"

df -H | head -2
# Retrieve disk info (human readable) limit to last two lines

echo -e "\nWho is logged in: \n $(who) \n"

echo -e "\nExec Files:" >>~/research/sys_info.txt

find /home -type f -perm 777 >>~/research/sys_info.txt

echo -e "\nTop 10 Processes" >>~/research/sys_info.txt

ps aux -m | awk {'print $1, $2, $3, $4, $11'} | head >>~/research/sys_info.txt
