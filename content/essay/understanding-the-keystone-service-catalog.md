---
title: "Understanding the Keystone Service Catalog"
author: "Glen Campbell"
date: "2012-06-04T14:22:06-07:00"
category: essays
tags: [openstack, keystone, identity, json, github]
gist: true
comments: true
---
[Keystone](http://keystone.openstack.org) is the authentication and identity service for the [OpenStack](http://www.openstack.org) cloud services. To handle the authentication chores, it provides a specialized API; to authenticate, the user sends a POST request to an authentication URL, sending the username and password (or API key), and Keystone returns an access token along with a _service catalog_ that lists all of the services that are available to the user. Because authentication can be expensive, the access token can be used (for a limited period of time) to access any of the supported services without the need to hit the authentication service for each request. For the purposes of this post, I'm going to use the actual service catalog returned for my account on the Rackspace cloud (with the security-critical components redacted, of course).

<script src="https://gist.github.com/gecampbell/7661550.js"></script>

This is a JSON object; at its highest level, it has three elements:

  * "access": the access token and tenant information,
  * "serviceCatalog": the service catalog itself, and
  * "user": the user name and groups/roles.

#### The "access" element (line 2)

This has one sub-element, **token**, which has three sub-elements: **id**, **expires**, and **tenant**.

  * **access->token->id**: the access token itself, which must be passed to the other services for authentication,
  * **access->token->expires: timestamp for when the access token expires. It's up to the cloud provider to** determine the lifetime of the access token. Needless to say, once the time has expired, the token will no longer be accepted, and you must re-authenticate (this is to prevent someone else from stealing your token and assuming your identity).
  * **access->token->tenant**: information about the tenant associated with the authenticated username/password.
You'll need the token ID to access other services.

#### The "serviceCatalog" element (line 11)

This is the service catalog proper; it consists of an array of objects identified as "endpoints":

<script src="https://gist.github.com/gecampbell/7661564.js"></script>

Here are the key elements of the "endpoints" object:

  * an anonymous array of **endpoints**, each identified by **region** (defined by the provider). In this example, the region is "DFW," meaning that the service is hosted in the Rackspace DFW region.
  * **name**: a provider-specified name for the service.
  * **type**: the type of service. "compute" is the OpenStack Compute (Nova) service; "cloudFiles" is the Rackspace Cloud Files service.

Now, this is the important point: to know which service to use, you must be able to identify it by the **region** ("DFW"), the **type** ("compute"), and the **name** ("cloudServersOpenStack"). This is because there may be multiple instances of the same service type; in the larger example, you'll see that there are two "compute" services, one named "cloudServers" and the other "cloudServersOpenStack." There can also be multiple regions that support the same service. You'll need to have documentation from your provider as to what values to use. At Rackspace, "cloudServers" refers to our first-generation Cloud Servers product, while "cloudServersOpenStack" is the next-generation Cloud Servers built using the [OpenStack Nova](http://nova.openstack.org) product. How you retrieve the exact URL you need, of course, depends on the programming language you're using. In [PHP](http://www.php.net), for example, you can use the [json_decode()](http://www.php.net/json_decode) function to convert the JSON into a PHP object. However, PHP doesn't really have an easy way to represent anonymous array elements, so it turns them into a regular (numerically-indexed) array that you must iterate over to find the right endpoint.
