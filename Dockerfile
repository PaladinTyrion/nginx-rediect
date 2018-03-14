# for nginx kibana redirect
FROM nginx:alpine
MAINTAINER paladintyrion <paladintyrion@gmail.com>

RUN set -x \
    && apk update \
    && apk add --no-cache apache2-utils \
    && mkdir -p /usr/local/nginx/conf/passwd \
    && htpasswd -c -b /usr/local/nginx/conf/passwd/kibana.pwd tyrion tyrion \
    && chmod -R +r /usr/local/nginx/conf/passwd

COPY ./entrypoint.sh /entrypoint.sh
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/nginx.default.conf /etc/nginx/conf.d/default.conf

RUN chown -R nginx:nginx /entrypoint.sh \
    && chmod +x /entrypoint.sh \
    && chmod +r /etc/nginx/nginx.conf /etc/nginx/conf.d/default.conf

# expose ports
EXPOSE 81 9991

# entrypoint
ENTRYPOINT ["/entrypoint.sh"]

# start nginx
CMD ["nginx", "-g", "daemon off;"]
