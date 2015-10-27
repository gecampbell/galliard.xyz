---
title: "Siteframe"
author: "Glen Campbell"
date: "2011-12-27T21:45:20-07:00"
category: essays
tags: [siteframe, photography, contax]
comments: true
---

> PLEASE NOTE: Siteframe has known security
> vulnerabilities and should not be used in a production environment.
> Links to the source code repositories are at the end of this
> article should you wish to take over maintenance.

In 1997, I acquired a Contax T*IX camera. It used APS film, and was
small and light, and had an extraordinary Carl Zeiss lens. After a
year or two, I upgraded to a Contax G1, an innovative autofocus
rangefinder camera in 35mm format (which also had superb Carl Zeiss
lenses). Looking for more information, I found an Internet mailing
list for other Contax G enthusiasts. By 1999, I had purchased the
domain **contaxg.com** and had set up a primitive website for sharing
photos among the members of the mailing list. People would email
me the photos, and I would manually edit the pages and upload the
images.

In 2000, I moved from England to Silicon Valley. I converted an old
PC to run Linux, and I started running **contaxg.com** over my DSL
line. Managing the site manually had become a burden, so I built a
somewhat less primitive site using PHP where people could upload
their own images. I had never had a lesson in the Internet protocols,
and I didn't know the difference between `GET`, `POST`, and `HEAD`,
so I made a lot of mistakes, but I learned a lot, too. I took that
learning and created what I called a "website toolkit," a set of
code that could be used to deploy an image-sharing website.

By February of 2001, this had become the first version of **Siteframe**,
a website framework that encapsulated much of what would become
known as "Web 2.0"&mdash;it supported user-submitted content, it
allowed online editing, it had comments, notifications, "skins,"
and most of the features that differentiate dynamic, user-managed
sites from the static websites of old. The web had become a toolbox,
not a display window. My experience with Siteframe helped me get
my first Internet-related job as a PHP developer at [Yahoo!
News](http://news.yahoo.com).

Siteframe went through multiple iterations; it was used as a legal
search engine and it was used as an internal content-management
system for some Yahoo! sites. When the Indonesian tsunami hit in
2005, someone used Siteframe to set up a website that was used for
the next several years to share documents and information among
various international relief agencies. At its peak, I was receiving
about 20,000 email registrations per year for Siteframe.

Alas, the pressures of time and family and other commitments kept
me from working on it, and it stagnated. As hackers became more and
more sophisticated, more and more security vulnerabilities were
revealed. Techniques that were commonplace in 2002 for building a
website turned out to open gaping holes in the site's (often minimal)
defenses. Earlier this year (2010), someone used a vulnerability
in Siteframe to hack one of my servers and use up more than 22
terabytes of bandwidth in just a few hours. The resulting charges
caused me to take down all my remaining Siteframe sites.

The code for [Siteframe is now available on
Github](https://github.com/gecampbell/Siteframe), but I strongly
recommend against using it for a production website. Hopefully,
someone will take it over and maintain it, but I would not bet on
it. There are newer, better technologies available for the same
purpose.

I like to tell people that I invented Web 2.0 and, to a certain
extent, it's true. **contaxg.com** allowed people to take control
of their web content long before sites like [Flickr](http://www.flickr.com)
and Picasa came on the scene. I learned a lot about photography,
PHP, HTTP, the Internet, and security. And I met a ton of really
creative people along the way. Many thanks to everyone who participated.

Related Links:

  * [Siteframe v3 on Github](https://github.com/gecampbell/Siteframe)
  * [Newer version of Siteframe (v5 codenamed "Beaumont")](https://github.com/gecampbell/Siteframe-Beaumont)
