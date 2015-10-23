---
title: "I accidentally my servers"
author: "Glen Campbell"
date: "2013-03-04T11:14:46-07:00"
category: essays
tags: [cloud, backup, stupidity]
comments: true
---
As you long-term readers of this blog know (both of you), I work for the [Rackspace Developer Relations Group](http://developer.rackspace.com). I wrote the [php-opencloud](http://php-opencloud.com) language bindings that are used in the Rackspace Cloud SDK for PHP. As part of this development process, I create an awful lot of cloud objects: servers, blog storage volumes, virtual networks, load balancers, etc. So one of my steps is a script called [`cleanup.php`](https://github.com/rackspace/php-opencloud/blob/master/samples/cleanup.php) that deletes _everything_ in my cloud account. And I do mean _everything_: every server, every modicum of storage, every load balancer: EVERYTHING.

On Friday, I ran this script whilst signed on under my personal cloud account, thus deleting _everything_, at least in the DFW data center.

Needless to say, this was not A Very Good Thing.

Luckily, I am fairly religious about backing things up, and I was able to rapidly recover nearly everything within a few hours. The biggest single loss was my mailing lists[1. The reason that the mailing lists were not backed up was because of the size; I meant to get around to backing them up soon, but I should have done it sooner. It's totally my fault.] that I've been running since 2001&mdash;some of them had hundreds of members and tens of thousands of messages, and they're still gone. I think I have backups on CD somewhere in the house, but I'll have to dig them out.

Oh, by the way, are you familiar with [Rackspace Cloud Backup](http://www.rackspace.com/cloud/backup/)? This service does automated, file-level backups hourly, daily, weekly, or monthly, and at a very reasonable cost. It's now running on all of my systems; if I had been running it before this incident, it might have helped me recover everything.

And `cleanup.php` has been modified so that it will only run in my test account.

My apologies to those of you who tried to access this site during its unscheduled downtime on Friday afternoon.
