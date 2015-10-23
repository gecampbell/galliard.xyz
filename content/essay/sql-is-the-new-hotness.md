---
title: "SQL is the new hotness"
author: "Glen Campbell"
date: "2012-09-25T11:24:21-07:00"
category: essays
tags: [sql, nosql, scalability, software development]
comments: true
---
There's a fascinating article over on [High Scalability](http://highscalability.com) that points out how [Google has meandered back into the fold of relational technology](http://highscalability.com/blog/2012/9/24/google-spanners-most-surprising-revelation-nosql-is-out-and.html). After several years of NoSQL/BigTable emphasis for performance and low-latency, Google has concluded that:

> We believe it is better to have application programmers deal with performance problems due to overuse of transactions as bottlenecks arise, rather than always coding around the lack of transactions.

This fits well with my experience: using NoSQL databases does not do away with the need for referential integrity; it merely means that referential integrity (RI) has to be reimplemented from scratch with each new application program (with varying degrees of success). I've never seen a "big data" application, apart from the simplest and most trivial, that did not have a fundamental requirement for referential integrity between collections of data.

It is a truism, by the way, that any general solution (SQL) can be made more efficient in a custom implementation (custom RI in Hadoop, for example). However, the general solution buys you the ability to avoid that reimplementation penalty with each new application, as well as the lower cost and more stability of a tried and tested solution.

With the availability of SQL databases on modern hardware, there are very, very few applications that actually _require_ the throughput provided by NoSQL. In most of those cases, the costs of _not_ implementing SQL far outweigh the performance benefits achieved.

It's nice to see that Google finally agrees with me.
