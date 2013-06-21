#!/bin/bash
### BEGIN INIT INFO
# Provides:          boot_prompt
# Required-Start:    $local_fs $remote_fs $network $syslog $named
# Required-Stop:     $local_fs $remote_fs $network $syslog $named
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
echo -e "\n      \e[0;30;47m https://$IPADD:6767 \n\e[0m" >> /etc/issue
