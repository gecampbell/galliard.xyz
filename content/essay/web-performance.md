---
title: "Boost your website performance"
author: "Glen Campbell"
date: "2013-03-23T17:35:00-07:00"
category: essays
tags: [web, performance, optimization]
comments: true
---

One of the reasons I moved this site away from
[Wordpress](http://www.wordpress.org) is because the performance
was very poor. By using a static framework instead of having to
dynamically fetch content from a database and re-render the pages
with each view, the static architecture vastly speeds up the
server-side rendering.

However, the biggest performance effects come on the client side.
Specifically, there are a number of things that you can do to improve
the performance of almost any site:

1. Reduce the number of HTTP requests. This is the single biggest problem
   with most websites. Each HTTP request requires an additional
   access over the Internet, and the browser has to do this for
   every resource it needs to render the page: every CSS file,
   image, Javascript file, and so forth.  Some simple-looking pages
   need literally hundreds of HTTP requests to build them, and
   performance suffers because of it.
2. Put the Javascript at the bottom of the page, preferably below the
   `</html>` tag. When the browser encounters a `<script>` tag, all
   other processing ceases; it no longer downloads resources in
   parallel, and everything has to wait until the Javascript is
   finished parsing and running.
3. Cache everything. Resources load the fastest when they don't have to be
   fetched from the source each time.
4. Compress the content. Using GZIP compression can reduce the total amount
   of data transferred by 50% or more.

There are a number of other tips and tricks that you can do, but
these will have the most impact.  See the [Yahoo! best practices
for speeding up your
site](http://developer.yahoo.com/performance/rules.html).

[Click here](http://gtmetrix.com/reports/glen-campbell.com/LXUbW8Lw)
for a performance analysis of the home page of this site.

For reference, here is the `.htaccess` file that I use:

	# custom 404 handler
	ErrorDocument 404 /404.html

	# set expires headers
	ExpiresActive On
	ExpiresDefault "access plus 10 minutes"
	ExpiresByType image/png "access plus 1 month"
	ExpiresByType image/jpeg "access plus 1 month"
	ExpiresByType image/gif "access plus 1 month"
	ExpiresByType image/x-icon "access plus 1 month"
	ExpiresByType audio/mp3 "access plus 10 years"
	ExpiresByType text/css "access plus 10 years"
	ExpiresByType application/javascript "access plus 2 months"
	ExpiresByType application/x-javascript "access plus 2 months"

	# compress text, html, javascript, css, xml:
	AddOutputFilterByType DEFLATE text/plain
	AddOutputFilterByType DEFLATE text/html
	AddOutputFilterByType DEFLATE text/xml
	AddOutputFilterByType DEFLATE text/css
	AddOutputFilterByType DEFLATE application/xml
	AddOutputFilterByType DEFLATE application/xhtml+xml
	AddOutputFilterByType DEFLATE application/rss+xml
	AddOutputFilterByType DEFLATE application/javascript
	AddOutputFilterByType DEFLATE application/x-javascript

	# rewrite to break caches
	RewriteEngine On
	RewriteBase /
	# rewrite versioning for CSS, JS
	RewriteRule ^v[0-9]+(/.*)$ 	$1 			[PT]
	# redirect wordpress-style RSS feed
	RewriteRule ^feed/ 			/rss.xml	[R=301]

	# turn off ETags
	FileETag None

From top to bottom:

1. Custom 404 page.
2. Set expires headers for CSS, audio, and other files to be some distance
   in the future. This ensures that the browser can cache them.
3. Compresses everything that can be compressed[^1].
4. Funky custom rewrite rule that lets me version the CSS and Javascript files.
   See below for details.
5. Turning off ETags. (Read the Yahoo! best practices; ETags are only useful
   if you're running on a single server. I have redundant servers behind a
   load balancer.)

The real "magic" here is in the combination of the `ExpiresByType`
and `RewriteRule` lines. The `ExpiresByType` ensures that CSS and
Javascript files have an `Expires:` header set to 10 years in the
future. This means that the user's browser will keep them in its
cache, essentially forever.

However, through the magic of the [Apache mod_rewrite
module](http://httpd.apache.org/docs/current/mod/mod_rewrite.html), I'm
not renaming the file each time; I'm just giving it a different
URL.

I'm using [Wok](/essay/wok.html), a static
site generator written in Python. Wok allows "hooks"; small pieces
of code that are executed at specific points in the generation
pipeline.  The `site.start` hook is called at the beginning, before
anything is generated.

In the `site.start` hook, I have a little bit of code that creates
a variable containing the current UNIX timestamp (the number of
seconds since January 1, 1970). In the templates that create the
base HTML for the pages, I insert that timestamp into the URL for
the CSS and JS files.

So, for example, the CSS file that resides here:

	/css/glenc.css

Gets turned into this when the HTML is generated:

	/v1364262362/css/glenc.css

Note that the file itself is not moved; it's only the reference to
it in the HTML that is modified. And here's where `mod_rewrite`
comes into play. This rewrite rule:

	RewriteRule ^v[0-9]+(/.*)$ $1 [PT]

strips the "version" prefix (a literal "v" at the beginning followed
by a string of numbers) and continues processing the file.

The result is that the file gets a new version number (and thus a
new URL) each time the site is published. Since the user's browser
does not have this new URL cached, it fetches it again from the
site, thus ensuring that any changes in styling or Javascript are
seen. If the site hasn't changed, then the file is retrieved from
the browser cache (or an intermediate caching proxy), thus preventing
an extra HTTP request to the site.

This is done for all of the static assets on the site: CSS files,
Javascript files, and even some images.

*Note:* if you're looking through the source code, you'll see that
there's a bunch of other things that the `links.py` file does. This
is mostly to support Wok's development server, which does not use
Apache. On the dev server, the hooks create a symbolic link from
the version directory to the top-level directory, thus resulting
in the correct URL for the static assets. Those links are removed
when the site is published.

[^1]: Note that compression may cause problems on some older browsers.
      Frankly, I don't care. If you're still running IE5, then I don't need
      you as a reader.
