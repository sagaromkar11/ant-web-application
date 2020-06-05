#!/bin/bash
#rm -rf /home/ec2-user/*
cd /home/ec2-user/apache-tomcat-8.5.55/bin
if [ "$(ps -fu root | grep java | grep tomcat | wc -l)" -gt "0" ]
then
	echo 'Tomcat is running stop bash'
	./shutdown.sh
	sleep 5
	while [ "$(ps -fu root | grep java | grep tomcat | wc -l)" -gt "0" ]
	do
		sleep 5
	done
else
	echo 'Tomcat is not running stop bash'
fi 