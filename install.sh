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
