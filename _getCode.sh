#!/bin/sh
rm -rf public_html/*
rm -rf gatsby-build
mkdir -p gatsby-build
git clone https://a7b9ad562d57b74c1526907a61a7f54ab7192536@github.com/nmdp-ig/cibmtr-ig-landing.git gatsby-build/
cd gatsby-build
npm install -g gatsby
npm ci
gatsby build
cd public
mkdir -p ig
cd ig
git clone -b deploy-ready https://a7b9ad562d57b74c1526907a61a7f54ab7192536@github.com/nmdp-ig/hla-reporting-ig.git hla-reporting/
cd ..
cd ..
cd ..
cp -rf gatsby-build/public/ public_html/ 




