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

# shadowsocks
mkdir -p /app && cd /app
npm install shadowsocks
mv node_modules/shadowsocks/ ./
rm -fr node_modules
echo 'nohup node /app/shadowsocks/bin/ssserver &' >> /etc/rc.d/rc.local
/sbin/iptables -I INPUT -p tcp --dport 8388 -j ACCEPT
/etc/init.d/iptables save
