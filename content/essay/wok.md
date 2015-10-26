---
title: "Working with Wok"
author: "Glen Campbell"
date: "2013-03-21T07:45:00-07:00"
category: essays
tags: [wok, python, markdown, static]
comments: true
---

> **Note:** This essay is kept for historical reasons. I've moved the
  site from Wok to [Hugo](http://gohugo.io).
  
This site is built using the [Wok](http://wok.mythmon.com) static website
generator. The source for it is mostly plain text files in
[Markdown](http://daringfireball.net/projects/markdown/) format, and it is generated and then synced to the server.

This method of maintaining the site has several advantages over using,
for example, [Wordpress](http://www.wordpress.org) to dynamically generated
the site.

* Since all the pages are static HTML, there is a vastly reduce change of
  a security breach because of the underlying code.
* Static pages load and render much faster in the user's browser,
  giving them a superior experience in many ways.
* All the content is stored in
  [GitHub](https://github.com/gecampbell/xlerb.com),
  which makes it trivial for me to maintain and recover in case something
  goes wrong.
* The server resources are much, much less than using Wordpress; I don't
  need an extra database, and the actual requirements of the server are
  much smaller.
* If I need to scale to support huge traffic (not that that's likely here),
  then all I need to do is replicate the server and add a load balancer
  in front of it.
* It has a local server where I can test the site before I publish it, which
  gives me a chance to fix errors before they go live.

Like any technology, however, there are tradeoffs. Here are some of the
reasons you wouldn't want to build every site in this manner:

* It's fairly complicated. You need to install a bunch of software on your
  computer, since the burden of rendering the site is shifted to your
  local machine from the server.
* It's more difficult to add images; they need to be manually resized and
  stored before you can add them to pages. Wordpress has a number of
  very powerful features for image manipulation, even automatically pushing
  images to their content distribution network (CDN) so that they load
  faster in the user's browser.
* There's no fancy user interface for building and maintaining the site
  content. I'm editing this using a simple, plain text editor; it's an
  experience that many users are not comfortable with.
* Wok is an open-source project that's built using other open-source
  projects, and the documentation is poor. It's hard to find things; like
  many open-source projects, the authors really expect you to read the
  source code.
* With Wordpress, you have access to a vast library of themes and lots of
  support. With a system like this, you're pretty much on your own.

Would I recommend this approach? In general, no. It's really much easier
to set up a Wordpress site than it is to get something like this working.
On the other hand, if you're a hacker like I am, it can provide a compelling
experience for the user while making it easy for me to maintain.
