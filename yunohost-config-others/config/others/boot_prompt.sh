#!/bin/bash
### BEGIN INIT INFO
# Provides:          boot_prompt
# Required-Start:    $all
# Required-Stop:     $all
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# X-Interactive:     true
# Short-Description: Add IP and MAC in /etc/issue
### END INIT INFO

if [[ -f /proc/uptime ]];
then
	uptime=$(</proc/uptime)
	uptime=${uptime//.*}
fi
if [[ -n ${uptime} ]]; then
        secs=$((${uptime}%60))
        mins=$((${uptime}/60%60))
        hours=$((${uptime}/3600%24))
        days=$((${uptime}/86400))
        uptime="${mins}m"
        if [ "${hours}" -ne "0" ]; then
                uptime="${hours}h ${uptime}"
        fi
        if [ "${days}" -ne "0" ]; then
                uptime="${days}d ${uptime}"
        fi
fi

cpu=$(awk 'BEGIN{FS=":"} /model name/ { print $2; exit }' /proc/cpuinfo | sed 's/ @/\n/' | head -1)
if [ -z "$cpu" ]; then
        cpu=$(awk 'BEGIN{FS=":"} /^cpu/ { gsub(/  +/," ",$2); print $2; exit}' /proc/cpuinfo | sed 's/, altivec supported//;s/^ //')
        if [[ $cpu =~ ^(PPC)*9.+ ]]; then
                model="IBM PowerPC G5 "
        elif [[ $cpu =~ ^74.+ ]]; then
                model="Motorola PowerPC G4 "
        else
                model="IBM PowerPC G3 "
        fi
        cpu="${model}${cpu}"
fi

loc="/sys/devices/system/cpu/cpu0/cpufreq"
if [ -f $loc/bios_limit ];then
        cpu_mhz=$(cat $loc/bios_limit | awk '{print $1/1000}')
elif [ -f $loc/scaling_max_freq ];then
        cpu_mhz=$(cat $loc/scaling_max_freq | awk '{print $1/1000}')
else
        cpu_mhz=$(awk -F':' '/cpu MHz/{ print int($2+.5) }' /proc/cpuinfo | head -n 1)
fi
if [ -n "$cpu_mhz" ];then
        if [ $cpu_mhz -gt 999 ];then
                cpu_ghz=$(echo $cpu_mhz | awk '{print $1/1000}')
                cpu="$cpu @ ${cpu_ghz}GHz"
        else
                cpu="$cpu @ ${cpu_mhz}MHz"
        fi
fi

cpu=$(echo "${cpu}" | sed -r 's/\([tT][mM]\)|\([Rr]\)|[pP]rocessor//g' | xargs)

hw_mem=0
free_mem=0
human=1024
mem_info=$(</proc/meminfo)
mem_info=$(echo $(echo $(mem_info=${mem_info// /}; echo ${mem_info//kB/})))
for m in $mem_info; do
        if [[ ${m//:*} = MemTotal ]]; then
                memtotal=${m//*:}
        fi

        if [[ ${m//:*} = MemFree ]]; then
                memfree=${m//*:}
        fi

        if [[ ${m//:*} = Buffers ]]; then
                membuffer=${m//*:}
        fi

        if [[ ${m//:*} = Cached ]]; then
                memcached=${m//*:}
        fi
done

usedmem="$(((($memtotal - $memfree) - $membuffer - $memcached) / $human))"
totalmem="$(($memtotal / $human))"
mem="${usedmem}MB / ${totalmem}MB"

ip=`/sbin/ifconfig | sed '/Bcast/!d' | awk '{print $2}' | sed 's/.*\://'`

echo -e "\n mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm Yunohost v2" > /etc/issue
echo -E " mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm Kernel: $(uname -m) $(uname -r)" >> /etc/issue
echo -E " mmmQ                       Ymmmm Uptime: ${uptime}" >> /etc/issue
echo -E " mmm#   .2A929     .12iQ7   :mmmm CPU: ${cpu}" >> /etc/issue
echo -E " mmmp    ;mmmm#   :mmmmp.   ,mmmm RAM: ${mem}" >> /etc/issue
echo -E " mmm#     ,mmmQ5 .Ymmmp     :mmmm IP: ${ip}" >> /etc/issue
echo -E " mmmp      ,mmmp ,mmmp      ,mmmm Domain: $(cat /etc/yunohost/current_host)" >> /etc/issue
echo -E " mmm#       ;mmmmNmmp       :mmmm " >> /etc/issue
echo -E " mmmp       .YmmmmmA;       ,mmmm " >> /etc/issue
echo -E " mmm#        .KmmmQY        :mmmm " >> /etc/issue
echo -E " mmmp         :mmm#         ,mmmm " >> /etc/issue
echo -E " mmm#        .7mmmp,        :mmmm " >> /etc/issue
echo -E " mmmp         7mmm#,        ,mmmm " >> /etc/issue
echo -E " mmm#                       :mmmm " >> /etc/issue
echo -E " mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm " >> /etc/issue
echo -E " mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm " >> /etc/issue
echo -e "\n      \e[0;30;47m Server IP: ${ip} \e[0m\n" >> /etc/issue

if [[ ! -f /etc/yunohost/installed ]]
then
        if [[ ! -f /etc/yunohost/from_script ]]
        then
		echo -e "\n mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm Yunohost v2"
		echo -E " mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm " 
		echo -E " mmmQ                       Ymmmm IP: ${ip}" 
		echo -E " mmm#   .2A929     .12iQ7   :mmmm " 
		echo -E " mmmp    ;mmmm#   :mmmmp.   ,mmmm " 
		echo -E " mmm#     ,mmmQ5 .Ymmmp     :mmmm " 
		echo -E " mmmp      ,mmmp ,mmmp      ,mmmm " 
		echo -E " mmm#       ;mmmmNmmp       :mmmm " 
		echo -E " mmmp       .YmmmmmA;       ,mmmm " 
		echo -E " mmm#        .KmmmQY        :mmmm " 
		echo -E " mmmp         :mmm#         ,mmmm " 
		echo -E " mmm#        .7mmmp,        :mmmm " 
		echo -E " mmmp         7mmm#,        ,mmmm " 
		echo -E " mmm#                       :mmmm " 
		echo -E " mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm " 
		echo -E " mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm " 
		echo -e "\n          \e[0;30;47m Post-installation \e[0m\n"
                read -p "Proceed to post-installation? (y/n) " -n 1
		RESULT=1
		while [ $RESULT -gt 0 ]; do
			if [[ $REPLY =~ ^[Nn]$ ]]; then
				exit 0
			fi
                        echo -e "\n"
			/usr/bin/yunohost tools postinstall
			let RESULT=$?
			if [ $RESULT -gt 0 ]; then
				echo -e "\n"
				read -p "Retry? (y/n) " -n 1
			fi
		done
        fi
fi
