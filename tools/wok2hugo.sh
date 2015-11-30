#!/bin/sh

SOURCEDIR=~/Documents/src/glencampbell.co/content
TARGETDIR=~/Documents/src/galliard.xyz/content/post/TEMP

for filename in `find $SOURCEDIR -type f`; do
    echo "File: " $filename
    targetfile=`basename $filename | sed -e 's/.markdown$/.md/'`
    echo "  Target: " $targetfile
    awk 'BEGIN { print "---\n"; } /datetime/ { sub("datetime","date"); sub("$","-07:00"); } /web 2.0/ { sub("web 2.0","web-20"); } { print; }' < $filename > $TARGETDIR/$targetfile
done