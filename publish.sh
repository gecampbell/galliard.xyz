#!/bin/sh

if [ -d public ]; then
    cd public
    aws s3 sync . s3://galliard.xyz \
        --cache-control 'max-age=600' \
        --delete
else
    echo 'public/ directory not found; exiting...'
    exit;
fi