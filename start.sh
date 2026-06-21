#!/bin/sh

cd /MTProxy

wget -qO proxy-secret https://core.telegram.org/getProxySecret
wget -qO proxy-multi.conf https://core.telegram.org/getProxyConfig

SECRET=${SECRET:-0123456789abcdef0123456789abcdef}

echo "Using secret: $SECRET"

exec ./objs/bin/mtproto-proxy \
  -u nobody \
  -p 8888 \
  -H 8888 \
  -S $SECRET \
  --aes-pwd proxy-secret proxy-multi.conf
