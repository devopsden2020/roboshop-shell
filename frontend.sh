echo -e "\e[33mInstalling Nginx server \e[0m"
yum install nginx -y &>>/tmp/roboshop.log

echo -e "\e[32mRemoving old app contents\e[0m"
rm -rf /usr/share/nginx/html/* &>>/tmp/roboshop.log

echo -e "\e[33Downloading Frontend content\e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip &>>/tmp/roboshop.log 2>/tmp/error.log

echo -e "\e[32Extract Frontend content\e[0m"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip &>>/tmp/roboshop.log

# we need to copy config file

echo -e "\e[33Starting Nginx server\e[0m"
systemctl enable nginx &>>/tmp/roboshop.log
systemctl restart nginx &>>/tmp/roboshop.log

