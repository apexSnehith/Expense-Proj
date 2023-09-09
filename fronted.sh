log_file=/tmp/expemse.log
echo installing nginx
dnf install nginx -y >> $log_file

echo placing expense config file in nginx
cp expense.conf /etc/nginx/default.d/expense.conf >> $log_file

echo removing default content
rm -rf /usr/share/nginx/html/* >> $log_file

echo download the fronted code
curl -s -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip >> $log_file

cd /usr/share/nginx/html

echo extracting fronted code
unzip /tmp/frontend.zip >> $log_file

echo start & enable nginx server
systemctl enable nginx >> $log_file
systemctl restart nginx >> $log_file
