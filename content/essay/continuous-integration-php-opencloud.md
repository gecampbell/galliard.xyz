---
title: "Continuous Integration for php-opencloud"
author: "Glen Campbell"
category: essays
tags: [continuous integration, travis, github, php, cloud]
date: "2013-03-30T08:30:00-07:00"
comments: true
---
This morning, I added the [php-opencloud](http://php-opencloud.com)
library to the [Travis continuous integration service](http://travis-ci.org).
Travis is a very cool service that automates continuous code testing.
It hooks into the [Github](https://github.com) system
and automatically performs tests whenever new code is pushed. If there are
errors, it will
send out notifications of the build status via IRC or email.

It makes it easy to do some things that have been a real pain for me, such
as testing against multiple versions of PHP. It's difficult to
maintain various versions of PHP for testing on my local laptop, so this
takes care of that for me.

Setting this up is very simple; after you create an account using your
Github login, you simple create a file `.travis.yml` in the root of
your repository. The one for php-opencloud looks like this:

	language: php
	php:
	  - "5.5"
	  - "5.4"
	  - "5.3"

This merely informs Travis that it uses [PHP](http://php.net) and that it
should be testing against those specified versions.

As an example as how Travis has already helped me, I don't even have PHP
version 5.5 on my laptop. I'm now getting test coverage there without
having to install it.

[Click here for the Travis data](https://travis-ci.org/rackspace/php-opencloud).
