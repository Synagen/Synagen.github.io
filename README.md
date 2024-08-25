# How to publish
Use the [Quarto](https://quarto.org/) publishing system, see links below for step-by-step guides.
## Links
- [Getting started with Quarto](https://quarto.org/docs/get-started/)
- [Create Quarto compatible notebooks for publishing from Jupyter Lab](https://quarto.org/docs/tools/jupyter-lab.html#overview)
- [Publishing with quarto to Github Pages workflow](https://quarto.org/docs/publishing/github-pages.html)

## Notes on DNS Config
- Domain is managed on [honcho.partnerconsole.net](honcho.partnerconsole.net)
- Instructions for how to setup the DNS can be found in [this GitHub Docs page](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site#configuring-an-apex-domain)
- Only difference is that we set a `CNAME` record to redirect ___synagen.github.io___ to the ___blog___ subdomain (which in turn redirects to the apex domain via the domain manager)
- Finally the custom domain on GitHub needs to be set to ___blog.synagen.com.au___
