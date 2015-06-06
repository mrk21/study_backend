#!/bin/bash

ROOT=$(pwd)
mkdir -p ${ROOT}/tmp/logs
ln -s ${ROOT} ${ROOT}/tmp/root

cd ${ROOT}/tmp/
wget http://openresty.org/download/ngx_openresty-1.7.10.1.tar.gz
tar xvf ngx_openresty-1.7.10.1.tar.gz
cd ngx_openresty-1.7.10.1/
./configure --prefix=${ROOT}/vendor/openresty --with-ld-opt='-L /usr/local/lib' --with-luajit
make -j2
make -j2 install

cd ${ROOT}/tmp/
wget http://keplerproject.github.io/luarocks/releases/luarocks-2.0.12.tar.gz
tar -xzvf luarocks-2.0.12.tar.gz
cd luarocks-2.0.12/
./configure --prefix=${ROOT}/vendor/openresty/luajit \
    --with-lua=${ROOT}/vendor/openresty/luajit/ \
    --lua-suffix=jit-2.1.0-alpha \
    --with-lua-include=${ROOT}/vendor/openresty/luajit/include/luajit-2.1
make -j2
make -j2 install
