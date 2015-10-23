---
title: "Vanity nameservers with Rackspace DNS"
author: "Glen Campbell"
date: "2013-02-28T13:34:12-07:00"
category: essays
tags: [dns, rackspace, whois]
comments: true
---
The Internet domain-name service (DNS) can be a complicated, convoluted thing to try to understand. Moreover, because people use names and not IP addresses to access websites, it has to be highly secure; someone hijacking a nameserver can damage vastly more sites than someone who merely hijacks a website.

There's also an issue of credibility, at least for technology companies. If someone performs a `whois` search on your domain:

`$ whois some-domain-or-other.com`

It will show them the primary name servers for that domain. For example, if I perform a `whois techcrunch.com` at the command line, it shows me this:

    Name Server.......... ns3.wordpress.com
    Name Server.......... ns1.wordpress.com
    Name Server.......... ns2.wordpress.com


This lets me know that [TechCrunch](http://techcrunch.com) is hosted by [WordPress](http://www.wordpress.com); if I know of a vulnerability at WordPress, then I can use that information to attack TechCrunch.

If I perform a `whois` search on `yahoo.com`, however, all I know is that the DNS is handled by Yahoo! I don't have any information that I can exploit to attack them, and I know that Yahoo! is a big enough company to handle its own DNS.

If you perform a `whois` search on `glenc.co`, you'll see this:

    Name Server: NS1.XLERB.COM
    Name Server: NS2.XLERB.COM


What the heck is `XLERB.COM`? A further `whois` query on that leads to:

    Name Servers:
      ns1.xlerb.com
      ns2.xlerb.com

Well, whatever `XLERB.COM` is, it does it's own DNS, right? Nope; the DNS for `XLERB.COM` is actually hosted by [Rackspace](http://www.rackspace.com). Here's how I did it.

  1. First, your domain for the name server needs to be hosted by Rackspace. I won't get into the details of how to do that (they're available online), but Rackspace DNS is free if you have a cloud account. Since all my servers are hosted by the Rackspace Cloud, I get the DNS service as a bonus.
  2. When you add a new domain to the Rackspace DNS system (via [the control panel](http://mycloud.rackspace.com), it assigns two default name servers: `ns1.stabletransit.com` and `ns2.stabletransit.com`. What you're going to do is to find the IP addresses of those two servers and create new `A` records in your domain that point to the same IP addresses. Use `nslookup ns1.stabletransit.com` (or `dig`) to find the IP addresses of those two domains.
  3. Create two `A` records in your domain that point to those IP addresses. In my case, I used `NS1.XLERB.COM` and `NS2.XLERB.COM`.
  4. Go to your domain registrar (in my case, it was the registrar that handles `XLERB.COM`) and look for something like "register nameservers." You'll have to dig through the site, and it may be under "Advanced Options" but all of the registrars should have it available.
  5. Register your new name servers there and use the same IP addresses you used for the `A` records, above. In my case, this was (again) `NS1` and `NS2.XLERB.COM`. This is required so that DNS can get the IP addresses from the top-level domain (TLD) servers and ensure that they're trusted, and not have to rely on the lower-level name servers, which might have been compromised. However, the records must match at both levels.
  6. Having registered the name servers at both the DNS provider (Rackspace) and at the registrar, you can now point your domains at them. This is the trivial part; unfortunately, you still have to do it twice. At the registrar for a domain, change the name servers to use your two new name servers; at Rackspace, edit the `NS` records and change `ns1` and `ns2.stabletransit.com` to use your newly-defined name servers.

Voila! Now, someone performing a `whois` query on your domain will find your customer name servers, and not the Rackspace ones. For example,

    whois unpretentious.org
    ....
    Name Server:NS1.XLERB.COM
    Name Server:NS2.XLERB.COM
    ...


Note, however, that there are certain risks associated with this; if, for example, Rackspace changes the IP addresses of its name servers, you'll have to modify both the registrar's name server records as well as the `A` records you defined in your domain.
