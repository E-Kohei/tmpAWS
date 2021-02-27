#!/bin/bash -ex

# apache web server
yum -y install httpd

# python
yum -y install gcc gcc-c++
yum -y install libffi-devel openssl-devel readline-devel zlib-devel gdbm-devel sqlite-devel
cd /usr/local/src
wget https://www.python.org/ftp/python/3.8.8/Python-3.8.8.tar.xz
tar -Jxf Python-3.8.8.tar.xz
cd /usr/local/src/Python-3.8.8
./configure
make
make install

# django and tensorflow
python3 -m pip install --upgrade pip
python3 -m pip install mysqlclient
python3 -m pip install django
python3 -m pip install tensorflow

