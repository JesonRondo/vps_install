#! /bin/sh

yum update
y

# gcc
yum -y install gcc gcc-c++ openssl-devel
y

# node
mkdir -p /tmp/pkg && cd /tmp/pkg
wget http://nodejs.org/dist/v0.10.35/node-v0.10.35.tar.gz
tar -xzvf node-v0.10.35.tar.gz
cd node-v0.10.35
./configure
make && make install

npm install -g n
n 0.11

# shadowsocks
mkdir -p /data/app && cd /data/app
npm install shadowsocks
mv node_modules/shadowsocks/ ./
rm -fr node_modules
echo 'nohup node /data/app/shadowsocks/bin/ssserver &' >> /etc/rc.d/rc.local
/sbin/iptables -I INPUT -p tcp --dport 8388 -j ACCEPT
/etc/init.d/iptables save

#blog
yum install git mysql mysql-server nginx
y
cd /data/app
git clone https://github.com/JesonRondo/vcms.git
git clone https://github.com/JesonRondo/notii.git
service mysqld start
mysqladmin -u root password pazzword
mysql -u root -p
pazzword
create database zombie;
use zombie;
exit
mysql -u root -p zombie < vcms/vcms.sql
pazzword

