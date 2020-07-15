#FROM php:7.3-rc-fpm-alpine
FROM dtr.nmdp.org:4444/nmdp/nmdp-php:7-fpm-alpine3.12.nmdp.latest
RUN apk update; \
    apk upgrade;
#ENV PHP_EXTRA_CONFIGURE_ARGS --enable-fpm --with-fpm-user=www-data --with-fpm-group=www-data
COPY php.ini /usr/local/etc/php/php.ini
