Galliard
========

Galliard is a blog that focuses on enjoying the world with text and
not images. It's open, meaning that you are welcome to contribute
if you care to.

## Contributing

Galliard is built using [Hugo](http://gohugo.io), a static site
generator. If you'd like to contribute to Galliard, fork this
repository and add a new post with Hugo like this:

    hugo new blog/{year}/{month}/your-blog-name.md

Your post will show up under
`content/blog/{year}/{month}/your-blog-name.md` and you can edit
it (in [Markdown](http://daringfireball.net/projects/markdown/syntax))
to your heart's content.

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
