#!/bin/bash
###Create backup directory
if [ -d /home/ec2-user/backup ]
then
	rm -rf /home/ec2-user/backup/*
	mkdir /home/ec2-user/backup/logs
else
	mkdir /home/ec2-user/backup
	mkdir /home/ec2-user/backup/logs
fi
###Copy old deployed war and logs to backup directory
cp /home/ec2-user/apache-tomcat-8.5.55/webapps/ant-web-application.war /home/ec2-user/backup
###Copy logs to backup directory
cp /home/ec2-user/apache-tomcat-8.5.55/logs/* /home/ec2-user/backup/logs
rm -f /home/ec2-user/apache-tomcat-8.5.55/logs/*
###Remove old deployed war
cd /home/ec2-user/apache-tomcat-8.5.55/webapps
rm -rf ant-web-application.war
###Copy new wars to deployment directory
cp /home/ec2-user/*.war /home/ec2-user/apache-tomcat-8.5.55/webapps
cd /home/ec2-user/apache-tomcat-8.5.55/bin
#source env.sh
./startup.sh
echo 'Hiii Start bash'