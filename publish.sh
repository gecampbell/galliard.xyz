#!/bin/sh

if [ -d public ]; then
    rm -rf public
fi
hugo
cd public
aws s3 sync . s3://galliard.xyz --delete --cache-control 'max-age=600'
rm -rf public
echo Done
