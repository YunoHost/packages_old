#!/bin/bash
### BEGIN INIT INFO
# Provides:          boot_prompt
# Required-Start:    $all
# Required-Stop:     $all
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# X-Interactive:     true
# Short-Description: Add IP and MAC in issue
### END INIT INFO

IPADD=`/sbin/ifconfig | sed '/Bcast/!d' | awk '{print $2}' | sed 's/.*\://'`
echo -e "\n mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm " > /etc/issue
echo -E " mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm " >> /etc/issue
echo -E " mmmQ                             Ymmmm " >> /etc/issue
echo -E " mmm#                             :mmmm " >> /etc/issue
echo -E " mmmp                             ,mmmm " >> /etc/issue
echo -E " mmm#      .2A929     .12iQ7      :mmmm " >> /etc/issue
echo -E " mmmp       ;mmmm#   :mmmmp.      ,mmmm " >> /etc/issue
echo -E " mmm#        ,mmmQ5 .Ymmmp        :mmmm " >> /etc/issue
echo -E " mmmp         ,mmmp ,mmmp         ,mmmm " >> /etc/issue
echo -E " mmm#          ;mmmmNmmp          :mmmm " >> /etc/issue
echo -E " mmmp          .YmmmmmA;          ,mmmm " >> /etc/issue
echo -E " mmm#           .KmmmQY           :mmmm " >> /etc/issue
echo -E " mmmp            :mmm#            ,mmmm " >> /etc/issue
echo -E " mmm#           .7mmmp,           :mmmm " >> /etc/issue
echo -E " mmmp            7mmm#,           ,mmmm " >> /etc/issue
echo -E " mmm#                             :mmmm " >> /etc/issue
echo -E " mmmp                             ,mmmm " >> /etc/issue
echo -E " mmm#                             :mmmm " >> /etc/issue
echo -E " mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm " >> /etc/issue
echo -E " mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm " >> /etc/issue
echo -e "\n      \e[0;30;47m Server IP: $IPADD \e[0m\n" >> /etc/issue

if [[ ! -f /etc/yunohost/installed ]]
then
        if [[ ! -f /etc/yunohost/from_script ]]
        then
		echo -e "\n mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm " 
		echo -E " mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm "
		echo -E " mmmQ                             Ymmmm "
		echo -E " mmm#                             :mmmm "
		echo -E " mmmp                             ,mmmm "
		echo -E " mmm#      .2A929     .12iQ7      :mmmm "
		echo -E " mmmp       ;mmmm#   :mmmmp.      ,mmmm "
		echo -E " mmm#        ,mmmQ5 .Ymmmp        :mmmm "
		echo -E " mmmp         ,mmmp ,mmmp         ,mmmm "
		echo -E " mmm#          ;mmmmNmmp          :mmmm "
		echo -E " mmmp          .YmmmmmA;          ,mmmm "
		echo -E " mmm#           .KmmmQY           :mmmm "
		echo -E " mmmp            :mmm#            ,mmmm "
		echo -E " mmm#           .7mmmp,           :mmmm "
		echo -E " mmmp            7mmm#,           ,mmmm "
		echo -E " mmm#                             :mmmm "
		echo -E " mmmp                             ,mmmm "
		echo -E " mmm#                             :mmmm "
		echo -E " mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm "
		echo -E " mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm "
		echo -e "\n          \e[0;30;47m Post-installation \e[0m\n"
                read -p "Proceed to post-installation? (y/n) " -n 1
		RESULT=1
		while [ $RESULT -gt 0 ]; do
			if [[ ! $REPLY =~ ^[Yy]$ ]]; then
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
