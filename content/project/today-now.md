---
title: "clock.fyi"
author: "Glen Campbell"
date: "2013-03-24T18:40:00-07:00"
category: essays
comments: true
tags: [internet,clock,time,date,website,software]
---

> **Note:** The site is now called [clock.fyi](http://clock.fyi).
  It was originally called `today-now.com`, then it moved to
  `itime.io` before settling on its current name. 

Your browser's home page should be something that is useful, even when
viewed repeatedly. In my case, I wanted a page that would display the
current time: a web clock, if you will.

<a href="http://www.flickr.com/photos/gecampbell/8589451624/" title="today-now.com by gecampbell, on Flickr"><img src="http://farm9.staticflickr.com/8377/8589451624_fef3f7b3ab_n.jpg" width="315" height="320" alt="today-now.com"></a>

I don't need it to be accurate to the second, but I do need it to be
as accurate: it needed to conform to the
<abbr title="Network Time Protocol">NTP</abbr> standard so that it was
never running fast or slow.

The result is [clock.fyi](http://clock.fyi), a simple little
site that displays the time and date. It has features for customizing
the appearance, and though the time only updates every <s>20 seconds or
so</s>,[^1] it is as accurate as the <s>server's</s> client's clock.

The source code is
[available on Github](https://github.com/gecampbell/clock.fyi).

[^1]: It now updates every second. 
