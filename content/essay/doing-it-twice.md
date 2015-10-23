---
title: "Doing It Right"
author: "Glen Campbell"
category: essays
date: "2013-07-22T12:00:00-07:00"
tags: [software,development,technical debt]
comments: true
---
Last week, I attended a meeting with many of my peers where one of the other managers expressed frustration at having to (re)build a configuration management and deployment system for each new project.  Why don't we just do this once and be done with it? she asked.

It's an excellent question, and one that many organizations fail to recognize.  I came back to my desk and tweeted my version of it:

<blockquote class="twitter-tweet"><p>My pet peeve in IT: &quot;We don&#39;t have time to do this right, so we&#39;ll do it twice.&quot;</p>&mdash; Glen Campbell (@glenc) <a href="https://twitter.com/glenc/statuses/357883903882694657">July 18, 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

The tweet rapidly took on a life of its own; by now, it's been retweeted more than 100 times.

The reason it struck a nerve is because it's an all-too-common situation.  Engineers quite often recognize that the proposed solution is a partial solution to the underlying problem, but management doesn't want to spend the resources (time, material, and people) to solve the whole problem; instead, they'll limit the solution to the immediate *instance* of the problem. This usually means that, until they decide to solve the original, deeper problem, they'll have to solve the same problem over and over again.

To engineers, this is "technical debt." It's called *debt* because it is an unrealized cost. At some point, the burden of maintaining multiple CI/CD solutions will be seen as expensive and the company will consolidate them, usually with a fair amount of pain. Like monetary debt, the pain may not be felt by the people who incurred the debt, but by their heirs: that is, whoever owns and has to maintain those systems somewhere down the line when they all need to be replaced.

Avoiding technical debt is not necessarily the right solution, however.  Like monetary debt, technical debt can be used to leverage resources so that more can be accomplished in a shorter time period.  Because we have a number of different teams implementing CI/CD solutions, none of them have to wait for a centralized system to be completed before they can proceed with their own deployments.  Multiple, parallel implementations allow teams to be more agile and flexible in their development.

Moreover, it's almost a certainty that some of those solutions will be better than others; this leads to a situation where, by allowing development to proceed in parallel, we can actually determine which solution works best for us.

In addition, there's no guarantee that having a centralized, common solution will be the best for every group. For example, a web application might be perfectly happy with deploying every hour, since most of the changes are minimal and can be backed out if they have problems. A financial system, however, may have much more stringent compliance, security, and deployment requirements that necessitate a more rigorous, slower deployment cycle (for example, some changes may be required *by law* to wait for implementation until a particular date).

So, while my peeve about "let's do things twice because we don't have time to do it right" may be perfectly valid, it should be understood that simply avoiding duplication (in and of itself) is not necessarily optimal for the entire organization.

Like monetary debt, technical debt can be beneficial for an organization, especially if it is repaid in a timely manner. The key is that incurring such debt should be done with deliberation and planning, and not as a mere accident of circumstance.
