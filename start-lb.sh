#!/bin/bash

IPS=${@}
nl='\n'
backends=''

for ip in $IPS; do
    backends+="        server ${ip}:6443 weight=5 max_fails=1 fail_timeout=5s;${nl}"
done;

sed -e "s/BACKENDS/$backends/g" nginx.conf.tpl > /etc/nginx/nginx.conf
echo 'Starting  nginx load balancer with this config:'
echo '=== NGINX.CONF BEGIN ==='
cat /etc/nginx/nginx.conf
echo '=== NGINX.CONF END ==='
cat /etc/nginx/nginx.conf
nginx -g "daemon off;"


