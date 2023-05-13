#!/bin/bash

#监控目标主机状态是否存活，
#监控方法， ping ICMP协议

#防止假报警：ping的报警阈值(3次失败，报警)，ping的频率(秒级，5秒或者1秒)


#循环三次，ping三次
for((i=1;i<4;i++))
do
	if ping -c1 192.168.0.60 &>/dev/null;ping -c1 192.168.0.52 &>/dev/null;ping -c1 192.168.0.53 &>/dev/null;ping -c1 192.168.0.54 &>/dev/null;ping -c1 192.168.0.55 &>/dev/null;ping -c1 192.168.0.56 &>/dev/null;ping -c1 192.168.0.57 &>/dev/null;ping -c1 192.168.0.58 &>/dev/null;ping -c1 192.168.0.59 &>/dev/null;then
		export ip"$i"=0		#定义全局变量，如果结果为真(ping同)赋值为0
	else
		export ip"$i"=1		#或者“set”定义局部变量也可

	fi
	sleep 0.3
done

if [ $ip1 -eq $ip2 ] && [ $ip2 -eq $ip3 ] && [ $ip1 -eq 1 ];then
	echo "Ip is down."
else
	echo "IP is up."
fi

#清除脚本中赋值的全局变量
unset ip1
unset ip2
unset ip3
