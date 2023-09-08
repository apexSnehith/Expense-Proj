#install nginx
dnf install nginx -y
#start & enable nginx server
systemctl enable nginx
systemctl start nginx
#removing default content
rm -rf /usr/share/nginx/html/*
#download the fronted content
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip
#copying the nginx reverse proxy configuration
cp expense.conf /etc/nginx/default.d/expense.conf
#restart service
systemctl restart nginx