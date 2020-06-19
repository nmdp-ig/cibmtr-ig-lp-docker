FROM node:11-alpine AS build

RUN apk add --no-cache --virtual .gyp python make g++ git

RUN mkdir /app
WORKDIR /app

COPY ./_getCode.sh /app

RUN chmod 777 /app/_getCode.sh
RUN /app/_getCode.sh

FROM httpd:2.4.35-alpine
RUN apk update; \
    apk upgrade;

COPY --from=build --chown=www-data:www-data /app/gatsby-build/public /final-build
COPY ./apache.conf /usr/local/apache2/conf/httpd.conf

RUN cp -r /final-build/ /usr/local/apache2/htdocs/

EXPOSE 80
EXPOSE 443