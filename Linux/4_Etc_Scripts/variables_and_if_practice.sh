#!/bin/bash


# Check script run as root. Exit if being run as root (checks for UID=0.)
if [ $UID -eq 0 ]; then
  echo "Please do not run this script as root."
  exit
fi


# Define Variables
output=$HOME/research/sys_info.txt
ip=$(ip addr | grep inet | tail -2 | head -1)
execs=$(sudo find /home -type f -perm 777 2>/dev/null)


# Check for research directory. Create if needed.
# $HOME = default variable equal to home path (or "cd ~/")
if [ ! -d $HOME/research ]; then
  mkdir $HOME/research
fi


# Check for output and clear if necessary.
if [ -f $output ]; then
  rm $output
fi


echo "A Quick System Audit Script" >> $output
date >> $output
echo "" >> $output
echo "Machine Type Info:" >> $output
echo -e "$MACHTYPE \n" >> $output
echo -e "Uname info: $(uname -a) \n" >> $output
echo -e "IP Info:" >> $output
echo -e "$ip \n" >> $output
echo -e "Hostname: $(hostname -s) \n" >> $output
echo "DNS Servers: " >> $output
cat /etc/resolv.conf >> $output
echo -e "\nMemory Info:" >> $output
free >> $output
echo -e "\nCPU Info:" >> $output
lscpu | grep CPU >> $output
echo -e "\nDisk Usage:" >> $output
df -H | head -2 >> $output
echo -e "\nWho is logged in: \n $(who -a) \n" >> $output
echo -e "\nexec Files:" >> $output
echo $execs >> $output
echo -e "\nTop 10 Processes" >> $output
ps aux --sort -%mem | awk {'print $1, $2, $3, $4, $11'} | head >> $output
