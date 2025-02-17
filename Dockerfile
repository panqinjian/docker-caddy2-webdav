FROM alpine:latest

RUN set -xe\
 && mkdir -p /usr/local/sbin\
 && wget https://caddyserver.com/api/download\?os\=linux\&arch\=arm64\&p\=github.com%2Fmholt%2Fcaddy-webdav -O /usr/local/sbin/caddy\
 && chmod +x /usr/local/sbin/caddy\
 && mkdir /tmp/caddy\
 && chmod 777 /tmp/caddy

ENV WEBDAV_ROOT="/www"\
    WEBDAY_PREFIX=""

COPY docker-entrypoint.sh /usr/local/sbin/entrypoint.sh

VOLUME [ "/www", "/tmp/caddy" ]
EXPOSE 80
ENTRYPOINT [ "/usr/local/sbin/entrypoint.sh" ]
