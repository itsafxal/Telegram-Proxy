#!/bin/bash

cd /MTProxy

curl -s https://core.telegram.org/getProxySecret -o proxy-secret
curl -s https://core.telegram.org/getProxyConfig -o proxy-multi.conf

SECRET=$(head -c 16 /dev/urandom | xxd -ps)

echo "====================================="
echo "MTProto Secret: $SECRET"
echo "====================================="

./objs/bin/mtproto-proxy \
-s $SECRET \
-p 443 \
-H 443 \
--aes-pwd proxy-secret proxy-multi.conf
