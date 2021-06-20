# gets free memory, disk useage, free disk space, and open files
# can be redirected into a file (obviously)

sudo free -m > ~/backups/freemem/free_mem.txt

sudo df -h | awk '{print $1,$3}' > ~/backups/diskuse/disk_useage.txt

sudo df -h | awk '{print $1,$4}' > ~/backups/freedisk/free_disk.txt

sudo lsof > ~/backups/openlist/open_list.txt
