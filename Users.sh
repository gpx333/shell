#!/bin/bash
date=`date +"%Y-%m-%d__%T"`                                    #date代表当前时间
num_users=`cat /etc/passwd | grep "bash" | cut -d ":" -f 1 | wc -l`  #num_users代表用户总数
users=`last | head -n -2 | cut -d " " -f 1 | sort | uniq -c | sort -n -r | head -n 3 | awk '{print $2}' | xargs | tr " " ","`  #users代表近期最活跃的3个用户
root_users=`cat /etc/group | sort | grep "sudo" | cut -d ":" -f 4`   #root_users代表具有root权限的用户
current_name=`who | awk '{print $1 $5 $2 "\n"}' | tr "(" "_" | tr ")" "_" | xargs | tr " " ","`  #current_name代表当前在线用户
echo $date $num_users [${users}] [${root_users}] [${current_name}]
