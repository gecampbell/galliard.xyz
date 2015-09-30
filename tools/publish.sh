#!/bin/sh

if [ -d public ]; then
    echo Removing old public/ directory...
    rm -rf public
fi
echo Regenerating...
hugo
echo Publishing...
cd public
aws s3 sync . s3://galliard.xyz \
    --cache-control 'max-age=600' \
    --delete
echo Done