#!/bin/bash

./vendor/openresty/nginx/sbin/nginx -p $(pwd)/tmp -c root/nginx.conf
