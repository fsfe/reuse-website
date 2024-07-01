<!--
  SPDX-FileCopyrightText: Free Software Foundation Europe e.V.
  SPDX-License-Identifier: GPL-3.0-or-later
-->

# REUSE website

[![Build Status](https://drone.fsfe.org/api/badges/reuse/website/status.svg?ref=refs/heads/main)](https://drone.fsfe.org/reuse/website)
[![standard-readme compliant](https://img.shields.io/badge/readme%20style-standard-brightgreen.svg?style=flat-square)](https://github.com/RichardLitt/standard-readme)
[![REUSE status](https://api.reuse.software/badge/git.fsfe.org/reuse/website)](https://api.reuse.software/info/git.fsfe.org/reuse/website)

We're working to make managing copyrights and licenses in free and open
source software easier. This is the website for a guide of best
practices, meant to demonstrate how to add copyright and license
information to a project in ways which allow for more automation.

Most interesting files are located in `site/content/en/`, specifically:

- `site/content/en/spec-*.md` --- Versions of the specifications.
- `site/content/en/faq.md` --- Frequently asked questions.

## Install

There's no installation here, but to test the website locally, run
`hugo server` inside the `site/` directory. Typically, we let our Drone
CI build and deploy the website for us.

## Usage

Go to https://reuse.software/ and enjoy :-) If your project follows the
reuse guidelines, we encourage you to show that in your `README.md` and
similar! You will find this and more developer tools
[here](https://reuse.software/dev/).

## Contribute

We welcome your pull requests and issue reports. Please be aware that
this repository does not contain the specification, tutorial, and FAQ,
so please direct your inquiry to [reuse
docs](https://github.com/fsfe/reuse-docs).

Generally, we invite you to contact and join the [REUSE mailing
list](https://lists.fsfe.org/mailman/listinfo/reuse).

### Translation

The website "chrome" strings are localized using the standard, built-in [Hugo
i18n](https://gohugo.io/content-management/multilingual/) support. The Weblate
project for these strings is [REUSE Website
Strings](https://hosted.weblate.org/projects/fsfe/reuse-website-strings/).

Translation happens by conversion Markdown into _gettext_ using
[po4a](https://po4a.org). To generate the _.md_ files from the _gettext .po_
files, run: `po4a po4a.conf`. This also regenerates the _.pot_ file, which is
the _gettext_ translation template, and syncs changes to the _.po_ files. The
Weblate project for these strings is [REUSE Website
Markdown](https://hosted.weblate.org/projects/fsfe/reuse-website-markdown/).

## License

The theme used for this website is based on [github-project-landing-page](https://github.com/nsomar/github-project-landing-page) which is licensed under the
the [MIT license](https://github.com/nsomar/github-project-landing-page/blob/master/LICENSE.md).

The content of the website, the best practices, are licensed under [Creative Commons Attribution-ShareAlike 4.0](https://creativecommons.org/licenses/by-sa/4.0).

Please find the exact licenses and copyright holders in all file
headers, accompanying `.license` files, and the DEP-5 file in
`.reuse/dep5`.
