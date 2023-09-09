source common.sh

echo Disable MySql 8 version
dnf module disable mysql -y &>>$log_file

echo Copy MySql Repo file
cp mysql.repo /etc/yum.repos.d/mysql.repo &>>$log_file

echo Install MySql Server
dnf install mysql-community-server -y &>>$log_file

echo Start MySql Server
systemctl enable mysqld &>>$log_file
systemctl start mysqld &>>$log_file

echo Setup Root Password
mysql_secure_installation --set-root-pass ExpenseApp@1 &>>$log_file

