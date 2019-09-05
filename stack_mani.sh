#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then 
echo "your not a root user please execute the script with root user"
fi

# variables
user1home=/home/$(user1)
user1=student
log=/tmp/stack.log
tomcat_url=http://mirror.cc.columbia.edu/pub/software/apache/tomcat/tomcat-8/v8.5.37/bin/apache-tomcat-8.5.37.tar.gz
tomcat_dir=$(echo $tomcat_url | awk -F / '{print $NF}' | sed -e s/.tar.gz//)
war_url=https://s3-us-west-2.amazonaws.com/studentapi-cit/student.war
jdbc_url=https://s3-us-west-2.amazonaws.com/studentapi-cit/mysql-connector.jar
context='<Resource name="jdbc/TestDB" auth="Container" type="javax.sql.DataSource"maxTotal="100" maxIdle="30" maxWaitMillis="10000"
username="USERNAME" password="PASSWORD" driverClassName="com.mysql.jdbc.Driver"
url="jdbc:mysql://DB-ENDPOINT:3306/DATABASE"/>'


stat()
{
if [ "$1" -ne 0 ]; then
echo -e "\e[31mnot successfull\e[0m"
echo -n " please refer the log file for more /tmp/stack.log"
exit 2
else
echo -e  "\e[32msuccessfull\e[0m"
fi
}

# insatlling web service

echo -n "installing web service"
yum install httpd -y &>> /tmp/stack.log
stat $?

# creating proxy config in webserver

echo -n "create proxy config"
echo 'ProxyPass "/student" "http://localhost:8080/student"
ProxyPassReverse "/student"  "http://localhost:8080/student"' > /etc/httpd/conf.d/app-proxy.conf
stat $?

# setting uo default index file

echo -n "setup default index file"
curl -s https://s3-us-west-2.amazonaws.com/studentapi-cit/index.html -o /var/www/html/index.html &>> $log
stat $?

# starting web server 

echo -n "starting web service"
systemctl enable httpd &>> $log
systemctl start http &>> $log
stat $?

# create user student if not exists

echo -n "create student user if doesnt exists - "
id -u $user1
if [ "$?" -ne 0 ]; then
user add $user1 &>> $log
echo -e "\e[31msuccessful\e["
else
echo -e "\e[32mskipping\e["
fi

# install java

echo -n "installing java -"
yum install java -y &>> $log
stat $?

# install tomcat

echo -n "installing tomcat -"
cd $user1home
wget -qO - $tomcat_url | tar -xf 
chown -R $user1:$user1 $tomcat_dir
stat $?



#downloading student war

echo -n "downloading student.war -"
cd $tomcat_dir
rm -rf webapps/*
wget -q $war_url -O - webapps/student.war
chown -R $user1:$user1 webapps/student.war
stat $?


#downloading jdbc jar

echo -n "downloading jar file -"
cd /$user1home/$tomcat_dir
wget -q $jdbc_url -O - lib/mysql-connector.jar
chown -R $user1:$user1 lib/mysql-connector.jar
stat $?

#modify the context.xml file to connect to database
cd $tomcat_dir
sed -i -e "$ i $context" conf/context.xml

# creating service file for tomcat

wget -q https://s3-us-west-2.amazonaws.com/studentapi-cit/tomcat-init -O /etc/init.d/tomcat
chmod +x /etc/init.d/tomcat
echo -n "setup tomcat init script - "
systemctl daemon-reload
systemctl enable tomcat
echo -n "starting tomcat - "
systemctl start tomcat
stat $?




















 

