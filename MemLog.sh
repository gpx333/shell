#!/bin/bash
last=$1                                                                       #last代表上一个动态平均值
date=`date +"%d-%m-%d__%T"`                                                   #date代表当前时间
total=`free -m | head -n 2 | tail -n 1 | awk '{printf $2}'`                   #total代表总内存
used=`free -m | head -n 2 | tail -n 1 | awk '{print $3}'`                     #used代表当前占用内存
remaining=$[$total-$used]                                                     #remaining代表内存剩余量
current=`echo "scale=1;${used}*100/${total}" | bc`                            #current代表当前内存占用率
dynamic_average=`echo "scale=1;0.3*${last}+0.7*${current}" | bc`              #dynamic_average代表占用百分比动态平均值
echo 20$date ${total}M ${remaining}M ${current}% ${dynamic_average}%