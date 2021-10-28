#!/bin/sh


[[ ${ENV} == prod* ]] || find /usr/local/apache2/htdocs -type f -exec sed -i "s|https://fhir.nmdp.org|https://${ENV}.fhir.nmdp.org|g" {} +

exec httpd-foreground
