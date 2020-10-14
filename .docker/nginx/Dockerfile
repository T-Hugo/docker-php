FROM nginx:1.19-alpine

ARG PHP_UPSTREAM_CONTAINER=php-fpm
ARG PHP_UPSTREAM_PORT=9000

# add our user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
RUN set -x ; \
    addgroup -Sg 82 www-data ; \
    adduser -u 82 -D -S -G www-data www-data
# 82 is the standard uid/gid for "www-data" in Alpine
# https://git.alpinelinux.org/aports/tree/main/nginx/nginx.pre-install

# add the nginx conf
COPY nginx.conf /etc/nginx/
COPY include /etc/nginx/include
COPY docker.conf /etc/nginx/sites-available/
RUN mkdir -p /etc/nginx/sites-enabled

# set upstream conf and remove the default conf
RUN echo "upstream php-upstream { server ${PHP_UPSTREAM_CONTAINER}:${PHP_UPSTREAM_PORT}; }" > /etc/nginx/conf.d/upstream.conf \
    && rm /etc/nginx/conf.d/default.conf

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
