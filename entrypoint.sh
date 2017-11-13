#!/bin/sh

set -e

nginx_config_file=/etc/nginx/nginx.conf

# sed -i -e "s/localhost:80/${BACKEND_SERVER}:${BACKEND_SERVER_PORT}/" $nginx_config_file

exec "$@"
