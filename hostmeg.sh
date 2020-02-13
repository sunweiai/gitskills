#!/bin/bash

HOST=`cat /etc/hosts|awk 'NR>=3{print $1}'`


for i in $HOST
do
    echo "***************服务器ip：$i ****************"
    echo "CPU核数"
    counts=`ssh root@$i cat /proc/cpuinfo |grep processor|awk '{print $1}'|uniq -c|awk '{print $1}'`
    echo $counts

    echo "总内存"
    memtotal=`ssh root@$i grep MemTotal /proc/meminfo|awk '{print $2}'`
    pro_MemTotal_G=$((memtotal/1024/1024))
    echo "$pro_MemTotal_G G" 
 
    echo "总硬盘"
    diskmemtotal=`ssh root@$i df -h |awk  'NR>1 {print $1"  "$2}'`
    echo "$diskmemtotal"

    echo "++++++++++++++++++++++++++++++++++++++++++++++++"
 
done

