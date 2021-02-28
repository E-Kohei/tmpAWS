#!/bin/bash -ex

## apache web server
yum -y install httpd


## mysql
cd /usr/local/src
wget https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm
yum -y install mysql80-community-release-el7-3.noarch.rpm
yum-config-manager --disable mysql57-community
yum-config-manager --enable mysql80-community
yum -y install mysql-community-devel

## python
yum -y install gcc gcc-c++
yum -y install libffi-devel openssl-devel readline-devel zlib-devel gdbm-devel sqlite-devel
cd /usr/local/src
wget https://www.python.org/ftp/python/3.8.8/Python-3.8.8.tar.xz
tar -Jxf Python-3.8.8.tar.xz
cd /usr/local/src/Python-3.8.8
./configure --enable-shared
make
make install
# set path to the shared library of python
echo "/usr/local/lib" > /etc/ld.so.conf.d/python-x86_64.conf
ldconfig


## mod_wsgi
yum -y install httpd-devel
cd /usr/local/src
wget https://github.com/GrahamDumpleton/mod_wsgi/archive/4.7.1.tar.gz
tar -zxf 4.7.1.tar.gz
cd /usr/local/src/mod-wsgi-4.7.1
./configure --with-apxs=/usr/bin/apxs --with-python=/usr/local/bin/python3.8
make
make install
echo "LoadModule wsgi_module modules/mod_wsgi.so" >> /etc/httpd/conf/httpd.conf


## django and tensorflow
python3 -m pip install --upgrade pip
python3 -m pip install mysqlclient
python3 -m pip install django
python3 -m pip install tensorflow


