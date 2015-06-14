#!/bin/bash

# configs
ROOT=$(pwd)
TMP_DIR=${ROOT}/tmp
OPENRESTY_DIR=${ROOT}/vendor/openresty
OPENRESTY_VERSION=1.7.10.1
LUAROCKS_VERSION=2.0.12


# prepare
rm -rf ${TMP_DIR}/
rm -rf ${OPENRESTY_DIR}/
mkdir -p ${TMP_DIR}/logs
ln -s ${ROOT} ${TMP_DIR}/root


# install openresty
# see: OpenResty - a fast web app server by extending nginx, Installation (http://openresty.org/)
# see: Nginx(OpenResty)でLuaを動かす＋パフォーマンス(ついでにHHVMも) - ゆっくり備忘録 (http://mitsuakikawamorita.com/blog/?p=1552)
http://openresty.org/
cd ${TMP_DIR}/
wget http://openresty.org/download/ngx_openresty-${OPENRESTY_VERSION}.tar.gz
tar xvf ngx_openresty-${OPENRESTY_VERSION}.tar.gz
cd ngx_openresty-${OPENRESTY_VERSION}/
./configure \
  --prefix=${OPENRESTY_DIR} \
  --with-luajit \
  --with-ld-opt='-L /usr/local/lib'
make -j8
make -j8 install


# install luarocks for openresty
# see: OpenResty - a fast web app server by extending nginx, UsingLuaRocks (http://openresty.org/#UsingLuaRocks)
cd ${TMP_DIR}/
wget http://keplerproject.github.io/luarocks/releases/luarocks-${LUAROCKS_VERSION}.tar.gz
tar xvf luarocks-${LUAROCKS_VERSION}.tar.gz
cd luarocks-${LUAROCKS_VERSION}/
./configure \
  --prefix=${OPENRESTY_DIR}/luajit \
  --with-lua=${OPENRESTY_DIR}/luajit/ \
  --lua-suffix=jit-2.1.0-alpha \
  --with-lua-include=${OPENRESTY_DIR}/luajit/include/luajit-2.1
make -j8
make -j8 install


# install lua modules
cd ${ROOT}
alias luarocks='./vendor/openresty/luajit/bin/luarocks'
luarocks install lua-resty-template


# install cpan modules
sudo cpanm App::Prove
sudo cpanm Test::Nginx
