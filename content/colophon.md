+++
author = "Glen Campbell"
date = "2015-10-28T13:08:43-07:00"
draft = false
tags = ["other","web","technology","hugo","amazon","s3","route53","cloudfront"]
title = "Colophon"

+++

This site is built with the [Hugo](http://gohugo.io) static site generator.
All of the content is written in 
[Markdown](http://daringfireball.net/projects/markdown/)
and it is all managed in a 
[Github repository](https://github.com/gecampbell/galliard.xyz).
(If you feel so inclined, you're welcome to add content
and submit a pull request.)

The typeface is, of course, 
[Galliard](/about.html).

The static site is hosted on 
[Amazon S3](https://aws.amazon.com/s3/)
and is served via
[Amazon CloudFront](https://aws.amazon.com/cloudfront/).
All the DNS is handled by
[Amazon Route53](https://aws.amazon.com/route53/).
The script used to upload the site is stored in the `/tools`
directory of the repository.
Most of the images used on this site are stored in either
[Flickr](http://flickr.glenc.xyz)
or
[500px](http://500px.glenc.xyz). 
The [podcast](/podcast.html) audio files (and some static images)
are also served via S3 and CloudFront. 

Note that 
[Perl](https://www.perl.org),
[sed](https://www.gnu.org/software/sed/manual/sed.html), and
[awk](http://www.gnu.org/software/gawk/manual/gawk.html)
are extensively used in the maintenance of the site.
