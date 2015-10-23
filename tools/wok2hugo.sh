#!/bin/sh

for file in *markdown; do
  base=`basename $file .markdown`
  mv $base.markdown $base.md
done

for file in *.md; do
  perl -p -i -e 's/^/---\n/ if ($.==1);' $file
done

perl -p -i -e 's/^title:\s(.*)$/title: "\1"/;' *md
perl -p -i -e 's/^datetime:\s(.*) (.*)$/date: "\1T\2-07:00"/' *md

for file in *.md; do
  perl -p -i -e 's/^/author: "Glen Campbell"\n/ if ($.==3);' $file
done
