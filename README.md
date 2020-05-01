<!--
  SPDX-FileCopyrightText: Free Software Foundation Europe e.V.
  SPDX-License-Identifier: GPL-3.0-or-later
-->

# REUSE website

[![Build Status](https://drone.fsfe.org/api/badges/reuse/website/status.svg)](https://drone.fsfe.org/reuse/website)
[![standard-readme compliant](https://img.shields.io/badge/readme%20style-standard-brightgreen.svg?style=flat-square)](https://github.com/RichardLitt/standard-readme)
[![REUSE status](https://api.reuse.software/badge/git.fsfe.org/reuse/website)](https://api.reuse.software/info/git.fsfe.org/reuse/website)

We're working to make managing copyrights and licenses in free and open
source software easier. This is the website for a guide of best
practices, meant to demonstrate how to add copyright and license
information to a project in ways which allow for more automation.

The specification, FAQ, and tutorial are located in a [separate "docs"
repository](https://github.com/fsfe/reuse-docs).

## Install

Before doing anything, run the following commands to download the documentation
as submodule, and to synchronise the contents of the submodule into the `site/`
directory:

```
git submodule update --init
bash sync-docs.sh
```

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

The website "chrome" strings are localized using the standard,
built-in [Hugo i18n](https://gohugo.io/content-management/multilingual/)
support.  Those files are in _data/_.

## License

The theme used for this website is based on [github-project-landing-page](https://github.com/nsomar/github-project-landing-page) which is licensed under the
the [MIT license](https://github.com/nsomar/github-project-landing-page/blob/master/LICENSE.md).

The content of the website, the best practices, are licensed under [Creative Commons Attribution-ShareAlike 4.0](https://creativecommons.org/licenses/by-sa/4.0).

Please find the exact licenses and copyright holders in all file
headers, accompanying `.license` files, and the DEP-5 file in
`.reuse/dep5`.
