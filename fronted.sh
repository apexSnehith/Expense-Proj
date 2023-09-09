echo installing nginx
dnf install nginx -y >> /tmp/expense.log

echo placing expense config file in nginx
cp expense.conf /etc/nginx/default.d/expense.conf >> /tmp/expense.log

echo removing default content
rm -rf /usr/share/nginx/html/* >> /tmp/expense.log

echo download the fronted code
curl -s -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip >> /tmp/expense.log

cd /usr/share/nginx/html

echo extracting fronted code
unzip /tmp/frontend.zip >> /tmp/expense.log

echo start & enable nginx server
systemctl enable nginx >> /tmp/expense.log
systemctl restart nginx >> /tmp/expense.log
