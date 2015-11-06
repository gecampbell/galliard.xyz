---
title: "Developing for the cloud"
author: "Glen Campbell"
date: "2012-05-30T13:57:14-07:00"
category: essays
tags: [cloud, development, software, rackspace, biography, texas]
comments: true
---
This post is really a personal announcement that I have taken a new
position within the [Rackspace Cloud](http://www.rackspace.com/cloud)
team. I'm now a member of the Developer Relations Group (DRG) and
my title is "Developer Advocate." (Please note that any opinions I
express in this post and elsewhere on this blog are my own and do
not necessarily reflect those of my employer.)

The DRG has two complementary functions: first, it's our job to
help developers use the Rackspace Cloud (and, by extension,
[OpenStack](http://www.openstack.org) in general). Second, we're
the representatives of cloud developers to the product teams at
Rackspace (and OpenStack) that are actually developing the cloud
products. For the first part, our initial goal is to create software
development kits (SDKs) that will provide specific language bindings,
sample code, and documentation for each of Rackspace's cloud products.
And, since most of Rackspace's cloud products are now based on
OpenStack software, these SDKs should help developers build
applications around any OpenStack-enabled cloud as well. Ultimately,
we hope to provide SDKs in the major languages used for programming
cloud applications&mdash;Python, Java, PHP, Ruby, C++, and so
on&mdash;but we are a small team and I expect these will trickle
out over time.

More importantly, we hope to curate the best of the existing language
bindings that are already available and, if they are open-source,
bring a certain amount of expertise to help improve them. Part of
working with the cloud, unlike working with a traditional hardware
infrastructure, is understanding what we're calling "Cloud-Related
Unique Challenges," or CRUCs. For example, to create a new server
in the cloud, you need to have an account on an OpenStack system;
your code will need to authenticate that account, retrieve a token,
and then use that token for making API calls. Moreover, the token
is issued for a finite timeframe (for example, 2 hours), after which
the token expires and must be renewed. It's very bad form to
re-authenticate with every API call, since that puts an undue burden
on the underlying authentication system (and will probably be
rate-limited as well).

But you also can't write code that simply retrieves a token and
then uses it blindly, because API calls will start failing once the
token expires. Thus a robust language binding will know how to
handle the initial authentication, manage the token, and handle
re-authentication when necessary. Some of the other CRUCs are
handling extensions (provider-specific enhancements to the underlying
OpenStack code), pagination (various products paginate results sets
in different manners), and handing different API versions. As our
team develops the expertise necessary for handling these problems,
we plan to not only incorporate those in our SDKs but also share
that knowledge with the larger development community. The second
part of the job is understanding the needs of developers who work
with cloud products and translating those needs back to the various
teams that are creating cloud products.

To do this effectively, we need to hear from developers; not the
developers who are creating the cloud products, but the developers
who are creating and maintaining applications that are built on the
cloud. There's no better time to start than now, so feel free to
contact me with your questions or concerns, and we'll do the best
we can to accommodate them. I'm also available via
[Twitter](http://twitter.com/glenc).


