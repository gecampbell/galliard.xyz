#!/bin/sh

if [ -d public ]; then
    echo Removing old public/ directory...
    rm -rf public
fi
echo Regenerating...
hugo
echo Publishing...
cd public
echo ==
echo Uploading HTML files...
echo ==
aws s3 sync . s3://galliard.xyz \
    --exclude '*.*' \
    --include '*.html' \
    --cache-control 'max-age=600' \
    --content-type 'text/html; charset=utf-8' \
    --delete
echo ==
echo Uploading non-HTML files...
echo ==
aws s3 sync . s3://galliard.xyz \
    --exclude '*.html' \
    --cache-control 'max-age=600' \
    --delete
echo Done