Galliard
========

Galliard is a blog that focuses on enjoying the world with text and
not images. It's open, meaning that you are welcome to contribute
if you care to.

## Contributing

Galliard is built using [Hugo](http://gohugo.io), a static site
generator. If you'd like to contribute, it will help if you download
Hugo from that link before you get started.

To contribute a new blog post to Galliard, fork this
repository and add a new post with Hugo like this:

    hugo new blog/{year}/{month}/your-blog-name.md

Your post will show up under
`content/blog/{year}/{month}/your-blog-name.md` and you can edit
it (in [Markdown](http://daringfireball.net/projects/markdown/syntax))
to your heart's content.

To see what your page looks like, run Hugo in server mode:

    hugo server -w

You can see the site locally on your computer. On mine, it's at
[http://127.0.0.1:1313/](http://127.0.0.1:1313) but look at the
output of the `hugo server` command to see where it ends up on
yours.  The `-w` will cause Hugo to monitor your changes or edits
and automatically update the site.

Submit a pull request and I'll either publish it, edit it and publish
it, or send it back with suggested changes. I suppose that if it's
awful enough, I might reject it outright, but let's not anticipate
a negative outcome.

## Publishing

The `publish.sh` script in the `tools/` directory is used to publish
the site to S3:

    tools/publish.sh

You of course need to have your credentials properly set up in the
`aws` CLI tool.
