#!/bin/bash

ROOT=$(pwd)
mkdir -p ${ROOT}/tmp/logs
mkdir -p ${ROOT}/vendor
ln -s ${ROOT} ${ROOT}/tmp/root

cd ${ROOT}/tmp/
wget http://openresty.org/download/ngx_openresty-1.7.10.1.tar.gz
tar xvf ngx_openresty-1.7.10.1.tar.gz
cd ngx_openresty-1.7.10.1/
./configure --prefix=${ROOT}/vendor/openresty --with-ld-opt='-L /usr/local/lib' --with-luajit
make
make install
