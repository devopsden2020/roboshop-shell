echo "-e[33mCopy mongoDB Repo file \e[0m"
cp mongodb.repo /etc/yum.repos.d/mongodb.repo  &>>/tmp/roboshop.log
echo "-e[33mInstalling mongodb server \e[0m"
yum install mongodb-org -y  &>>/tmp/roboshop.log

##Modify the config file
echo "-e[33mStart mongoDB service \e[0m"
systemctl enable mongod  &>>/tmp/roboshop.log
systemctl restart mongod  &>>/tmp/roboshop.log



