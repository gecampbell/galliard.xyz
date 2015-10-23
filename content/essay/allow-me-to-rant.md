---
title: "Please, allow me to rant a moment"
author: "Glen Campbell"
date: "2014-05-28T17:00:00-07:00"
category: essays
tags: [code, jekyll, assumptions]
comments: true
---

We're using [jekyll](http://jekyllrb.com) on some projects at work, so I thought that I would try it out on my laptop. I found the Jekyll [Quick-start guide](http://jekyllrb.com/docs/quickstart/), and it seems pretty straightforward:

<img  src="http://cdn.broadpool.com/Screen-Shot-2014-05-28-at-9.18.08-AM.png" alt="Jekyll quick start" width="680" height="289" class="center">

The problem, of course, is that it doesn't work:

<img src="http://cdn.broadpool.com/Screen-Shot-2014-05-28-at-9.20.55-AM.png" alt="fail" width="563" height="76" class="center">

<!--more-->

Apparently, Jekyll wants you to install this as root. Or, perhaps, the writer is running on a different system that permits regular users to install new software without privileges. Or something else: who knows? The fact of the matter is, these simple "quick start" instructions are a complete and utter failure. At this point, I have two options:

1. I can walk away, knowing that if I try to fix this, I'm going to dive into a multi-hour, multi-day fiasco of repetitive trial-and-error.
2. I can try to fix it and hope for the best. And probably dive into a multi-hour, multi-day fiasco of repetitive trial-and-error.

You who develop software: is this what you want?

I use this as a simple, most recent example, but it happens all the time. People who write Java code assume that every single human being on the face of the earth has a Java development environment set up exactly like theirs. Folks who code in Python assume that you have the exact same Python version and installed libraries as they do.

Here's a hint: before you release any documentation, ever, spin up a new, clean standard server using a common operating system like Ubuntu or Microsoft Windows. Run your code examples there. If they don't work for you then, they won't work for anyone else using it.

Moreover, if they *do* actually work, they *still* probably won't work for a bunch of users.

Document your dependencies: if the writer of Jekyll's quick start guide had added a footnote with his or her assumptions about operating system, environment, and dependencies, then I would at least have had some idea that there might be problems.

An old rule of thumb is "Under-promise and over-deliver." Documentation like this takes the exact opposite approach, and it pisses users off.
