echo "-e[33mInstalling Nginx server \e[0m"
yum install nginx -y >/tmp/roboshop.log

echo "-e[33mRemoving old app contents\e[0m"
rm -rf /usr/share/nginx/html/* >/tmp/roboshop.log

echo "-e[33Downloading frontend content\e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip >/tmp/roboshop.log

echo "-e[33Extract frontend content\e[0m"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip >/tmp/roboshop.log

vim /etc/nginx/default.d/roboshop.conf >/tmp/roboshop.log

echo "-e[33Starting Nginx server\e[0m"
systemctl enable nginx >/tmp/roboshop.log
systemctl restart nginx >/tmp/roboshop.log

