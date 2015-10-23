---
title: "Programmable DNS"
author: "Glen Campbell"
date: "2013-03-05T11:59:38-07:00"
category: essays
tags: [php, openstack, php-opencloud, dns]
gist: true
comments: true
---
I recently released a new version of [php-opencloud](http://php-opencloud.com) that includes support for [Rackspace Cloud DNS](http://www.rackspace.com/cloud/dns). This is a free service for managing your DNS (free if you have a cloud account). I've used numerous DNS services before (and I've even hosted my own BIND server), and most of them operate in a similar manner: there's a control panel on the web, and you use it to make changes as needed. Some of those services go further by providing reports and other operations, but Rackspace Cloud DNS has a fully programmable API.

It's been quite handy, for example to make mass changes to my domains. For example, let's say I want to change the email address associated with all of my domains.

<script src="https://gist.github.com/gecampbell/7661597.js"></script>

In this example, it simply loops through all the domains and updates the email address. This is much easier than logging into a control panel and manually updating dozens of domains.
