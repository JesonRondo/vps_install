#! /bin/sh

# gcc
yum -y install gcc gcc-c++ openssl-devel
y

# node
mkdir -p /tmp/pkg && cd /tmp/pkg
wget http://nodejs.org/dist/node-latest.tar.gz
tar -xzvf node-latest.tar.gz
cd node-latest
./configure
make && make install

npm install -g n
n 0.11.13
