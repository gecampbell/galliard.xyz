+++
author = "Glen Campbell"
date = "2015-12-22T10:16:48-08:00"
draft = false
location = "Lynnwood, WA (USA)"
tags = ["aws", "web", "cloud", "dns", "route53", "amazon", "soa", "delegation set"]
title = "Vanity Nameservers with AWS Route53"
+++

I have written about creating [vanity
nameservers](/essay/2013/02/vanity-nameservers-with-rackspace-dns.html)
before. When I [started working at Amazon](/essay/2015/06/amazon.html)
this year, I moved most of my personal infrastructure to the
[AWS](https://aws.amazon.com) cloud.

Amazon, like Rackspace, offers a DNS service; it's called
[Route53](https://aws.amazon.com/route53/).  When you create a new
*hosted zone* in Route53, it assigns a set of four default nameservers.
The nameservers are each in different top-level domains (TLDs):
`.com`, `.net`, `.org`, and `.co.uk`.  There's a good reason for
this; whenever a client goes to resolve a specific domain name, it
has to start at the TLD; for example, if you're trying to resolve
`example.org`, then you'd need to start at the `.org` TLD, then
issue a query for `example.org`.  By using a nameserver with the
same TLD as the domain, it eliminates one DNS query across the
Internet.

However, nameservers like `ns-1576.awsdns-05.co.uk` do not help
your brand; moreover, Bad Guys looking at them can see that you're
hosted by Amazon, and thus it gives them a potentially narrower
scope for attacking your site.

In addition, if you're registering dozens of domain names (like I
am), having to set up and manage different name servers for each
domain can drive you mad.

Luckily, Route53 provides a way around this, called *reusable
delegation sets*. (*Delegation set* is Amazon's term for a group
of nameservers.)

## Creating a reusable delegation set

There's no way to create and manage reusable delegation sets in the
AWS console, so you'll have to use the [AWS command-line interface
(CLI)](https://aws.amazon.com/cli/).

To start off, you'll create a reusable delegation set:

    $ aws route53 create-reusable-delegation-set --caller-reference XYZ.01

(The `--caller-reference` is an arbitrary string that you can use
to refer back to this transaction in the future.)

When you create the reusable delegation set, it will respond with
a JSON object with information about it:

    {
    "Location":
     "https://route53.amazonaws.com/2013-04-01/delegationset/N3UD5XKBF3YXYM", 
        "DelegationSet": {
            "NameServers": [
                "ns-167.awsdns-20.com", 
                "ns-1576.awsdns-05.co.uk", 
                "ns-961.awsdns-56.net", 
                "ns-1342.awsdns-39.org"
            ], 
            "CallerReference": "XYZ.01", 
            "Id": "/delegationset/N3UD5XKBF3YXYM"
        }
    }

There are two things to note about this (you should probably save
it to a file for later reference, by the way). First, the `Id` is
`/delegationset/N3UD5XKBF3YXYM`; you'll need this to refer to the
delegation set in the future.

## Creating vanity nameserver records

Second, you'll see that there are four `NameServers` defined; these
will become your vanity nameservers. Convert each of these to their
IP addresses:

    $ dig ns-1576.awsdns-05.co.uk
    ...
    ns-1576.awsdns-05.co.uk. 70673	IN	A	205.251.198.40
    ...

In this case, `ns-1576.awsdns-05.co.uk` becomes `205.251.198.40`.

Once you have these IP addresses, you can define hosts (`A` records)
in your vanity domain to make to them:

    NS1.MYVANITYDOMAIN.XYZ 3600 IN A 205.251.198.40

Now that you've defined those hosts, you can use them in your `SOA`
(start of authority records) and as the default nameservers for
your domains.

(I'm not going to go into all that detail here.)

## Using a reusable delegation set

To host a new domain with those nameservers on Route53, you'll need
to specify the delegation set ID:

    aws route53 create-hosted-zone --caller-reference XYZ.02 \
        --name MYNEWVANITYURL.COM \
        --delegation-set-id /delegationset/N3UD5XKBF3YXYM

This will create a default `SOA` record pointing to the original
Amazon-provided names; however, since you've created your own synonym
hostnames, you can just edit the domain to use yours.

Having done that, you can now update your domain at your
registrar to point to your new nameservers. Verify this with
the `whois` command:

    $ whois broadpool.com
    ...
    Name Server: NS1.BROADPOOL.COM
    Name Server: NS2.BROADPOOL.COM
    Name Server: NS3.BROADPOOL.COM
    Name Server: NS4.BROADPOOL.COM
    ....

Now most of my domains use these four nameservers.

One word of warning: It is possible (though unlikely) that the IP
address for a nameserver might change in the future. If it does,
you'll need to change your corresponding `A` record for the vanity
host. It's unlikely that all four of them would change at once, so
there's very little risk with this.
