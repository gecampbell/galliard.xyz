---
title: "Using Cloud Files CDN for podcasting"
author: "Glen Campbell"
category: essays
date: "2013-03-22T10:00:02-07:00"
tags: [music, cloud, audio, cdn, swift, openstack, php]
draft: true
---
While I've been rebuilding this site[^1], I've gathered together
all of my [podcasts](/podcasts.html) that I put together over the
last few years.  I didn't really want to serve all those MP3 files
from my cloud server account, since the bandwidth charges are high,
and large files like that could consume a lot of connections while
they are downloaded.

Instead, I've pushed all the files to the [Rackspace Cloud
Files](http://www.rackspace.com/cloud/files/) content distribution
network (CDN), which is built on top of Akamai. In this case, the
files can be served by a global network of edge caches, which means
that the performance will be better for the users and I won't incur
the bandwidth charges of serving them locally.

To push the files, I've created a fairly simple script that uses
the [php-opencloud](http://php-opencloud.com) library that I developed
for Rackspace's Cloud SDK for PHP.

[Click here to view the entire source code](https://github.com/gecampbell/glen-campbell.com/blob/master/mp3/push-cdn.php)

This is pretty straightforward, but I'll point out a few details:

1. At the beginning, I have `define('RAXSDK_TIMEOUT', 9999);`. This
   ensures that the HTTP requests to transfer the data do not time out.
   Because the MP3 files are large, they would normally hit the hard
   timeout limit built into the SDK.
2. I'm using the `SetUploadProgressCallback()` method to establish a
   function that will intermittently be called during the upload. That
   callback function (`upload_status()`, at the end of the script) keeps
   a running total of bytes uploaded and provides visual feedback for the
   user. Otherwise, the script would appear to sit idle for long periods
   of time.
3. To avoid the wait, I'm only uploading new or modified files. The modified
   files are detected if the file size between the local copy and the CDN
   copy are different. New files are detected in the `try { ... } catch()`
   block that surrounds the initial creation of the object. If the attempt
   to retrieve the object from Cloud Files fails, it creates a new, empty one.

I hope this is useful to you; let me know if you have any feedback via the
Twitter button, below.

[^1]: See [here](/articles/wok.html) for details.
