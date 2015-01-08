#! /bin/sh

# gcc
yum -y install gcc gcc-c++ openssl-devel
y

# node
mkdir -p /tmp/pkg && cd /tmp/pkg
wget http://nodejs.org/dist/v0.10.24/node-v0.10.24.tar.gz
tar -xzvf node-v0.10.24.tar.gz
cd node-v0.10.24
./configure --prefix=/usr/local/node
make && make install

npm install -g n
n 0.11.13
