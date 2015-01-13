#! /bin/sh

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

# nginx
rpm -ivh http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm
yum install nginx
y

# port
/sbin/iptables -I INPUT -p tcp --dport 8388 -j ACCEPT
/sbin/iptables -I INPUT -p tcp --dport 80 -j ACCEPT
/sbin/iptables -I INPUT -p tcp --dport 3306 -j ACCEPT
/sbin/iptables -I INPUT -p tcp --dport 443 -j ACCEPT
/etc/init.d/iptables save

# shadowsocks
mkdir -p /data/app && cd /data/app
npm install shadowsocks
mv node_modules/shadowsocks/ ./
rm -fr node_modules

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
cp notii/conf/vhost/longzhou.me.conf /etc/nginx/conf.d/
cp notii/conf/longzhou.me.crt /etc/nginx/
cp notii/conf/longzhou.me.key /etc/nginx/

# start
echo 'nohup node /data/app/shadowsocks/bin/ssserver &' >> /etc/rc.d/rc.local
echo 'nohup node --harmony /data/app/notii/bin/app &' >> /etc/rc.d/rc.local
echo 'service mysqld start' >> /etc/rc.d/rc.local
echo 'nginx' >> /etc/rc.d/rc.local
source /etc/rc.d/rc.local
