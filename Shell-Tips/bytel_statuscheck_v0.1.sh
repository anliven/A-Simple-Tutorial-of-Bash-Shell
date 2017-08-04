#! /usr/bin/bash

# Put this script in the /home/mcadmin directory
# Change the executable permission : chmod 755 /home/mcadmin/bytel_statuscheck.sh

# Add cronjob : echo "00 2 * * * /home/mcadmin/bytel_statuscheck.sh" >> /var/spool/cron/mcadmin
# Check cronjob : crontab -l


#### Check current user
if [ "mcadmin" != `whoami` ]; then
    echo "This script can only be run by mcadmin user!"
    exit 1
fi

echo "This operation may take a few minutes. Please wait!.... "


#### Create log directory 
mkdir -p /home/mcadmin/bytel_MMSC_monitor


#### Define variables
LogDir="/home/mcadmin/bytel_MMSC_monitor"
MCname=$(hostname)
NameCheck="${MCname:0:6}"
time=`date +%Y%m%d%k%M`
FileNamePre="Bytel_"$time"_"$MCname"_"


#### Check system status
top d 3 n 3 | grep "Cpu" > "$LogDir"/"$FileNamePre"_cpu.txt
free -m > "$LogDir"/"$FileNamePre"_mem.txt
df -h > "$LogDir"/"$FileNamePre"_disk.txt
top d 5 n 3 > "$LogDir"/"$FileNamePre"_top.txt
sar 5 3 > "$LogDir"/"$FileNamePre"_sar.txt
iostat 5 3 > "$LogDir"/"$FileNamePre"_iostat.txt


#### FE or BE node
if [ "$NameCheck" =  "mmscfe" ]
#if [ "$NameCheck" =  "Single" ]
then
    cp /opt/Nokia/SS_MMSC/var/tmp/current_alarms.txt "$LogDir"/"$FileNamePre"_alarms.txt
    cp /opt/Nokia/SS_MMSC/var/tmp/current_status.txt "$LogDir"/"$FileNamePre"_status.txt
    echo "set isolation to dirty read; select * from traffic_by_hours order by seconds;" | dbaccess mc - > "$LogDir"/"$FileNamePre"_traffic.txt
elif [ "$NameCheck" =  "mmscbe" ]
#elif [ "$NameCheck" =  "Single" ]
then
    onstat -d > "$LogDir"/"$FileNamePre"_DBspace.txt
    echo "set isolation to dirty read; select status,count(*) from mmo group by status;" | dbaccess mc - > "$LogDir"/"$FileNamePre"_mmo.txt
else
    echo "Warning! This scrpit should be executed on the MMSC server."
fi

echo "Complete! The relevant results have been saved in the /home/mcadmin/bytel_MMSC_monitor directory."