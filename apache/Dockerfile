FROM httpd:alpine3.14 as base

USER root

RUN set -x && \
        sed -i 's/https:\/\//http:\/\//g' /etc/apk/repositories && \
        cat /etc/apk/repositories && \
        apk update 
RUN     apk add --update python3 && ln -sf python3 /usr/bin/python
RUN     python3 -m ensurepip
RUN     pip3 install pip setuptools
RUN     apk add openssl ca-certificates curl git npm util-linux 
RUN     apk add vips-dev fftw-dev build-base python3 --update \
        --repository https://alpine.global.ssl.fastly.net/alpine/edge/testing/ \
        --repository https://alpine.global.ssl.fastly.net/alpine/edge/main
RUN     npm install -g gatsby-cli
RUN     npm install -g gatsby 
RUN     mkdir -p /gatsby-build
RUN     git clone https://a7b9ad562d57b74c1526907a61a7f54ab7192536@github.com/nmdp-ig/cibmtr-ig-landing.git /gatsby-build/
RUN     npm config set strict-ssl false
RUN     export NODE_TLS_REJECT_UNAUTHORIZED=0
RUN     cd /gatsby-build && \
        pwd && \
        #npm ci && \
        npm install && \
        gatsby build && \
        cd public && \
        pwd && \
        mkdir -p ig && \
        cd ig && \
        git clone -b deploy-ready-dev https://a7b9ad562d57b74c1526907a61a7f54ab7192536@github.com/nmdp-ig/hla-reporting-ig.git hla-reporting/ && \
        git clone -b deploy-ready-dev https://github.com/nmdp-ig/cibmtr-reporting-ig.git cibmtr-reporting/ 

RUN     chown -R www-data:www-data /gatsby-build

FROM httpd:alpine3.14

COPY --from=base /gatsby-build/public/ /usr/local/apache2/htdocs
COPY ./apache.conf /usr/local/apache2/conf/httpd.conf
COPY ./entrypoint/entrypoint.sh /entrypoint/entrypoint.sh

#Change access righs to conf, logs, bin from root to www-data
RUN chown -hR www-data:www-data /usr/local/apache2/

HEALTHCHECK --interval=60s --timeout=30s CMD nc -zv localhost 80 || exit 1
#Run as a www-data
USER www-data


EXPOSE 8081
EXPOSE 8443

#CMD ["/bin/sh", "-c", "exec /entrypoint/entrypoint.sh"]
#CMD ["exec /entrypoint/entrypoint.sh"]
