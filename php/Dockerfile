#FROM php:7.3-rc-fpm-alpine

FROM dtr.nmdp.org:4444/nmdp/nmdp-php:7-fpm-alpine3.12.nmdp.latest

RUN apk update; \
    apk upgrade;

COPY php.ini /usr/local/etc/php/php.ini
