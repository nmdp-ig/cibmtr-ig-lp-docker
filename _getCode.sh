#!/bin/sh
rm -rf public_html/*
rm -rf gatsby-build
mkdir -p gatsby-build
git clone https://github.com/nmdp-ig/cibmtr-ig-landing.git gatsby-build/
cd gatsby-build
npm install -g gatsby
npm ci
gatsby build
cd public
mkdir -p ig
cd ig
git clone -b deploy-ready https://github.com/nmdp-ig/hla-reporting-ig.git hla-reporting/
cd ..
cd ..
cd ..
cp -rf gatsby-build/public/ public_html/ 




