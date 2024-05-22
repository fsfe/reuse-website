---
# SPDX-FileCopyrightText: 2019 Free Software Foundation Europe e.V.
# SPDX-License-Identifier: CC-BY-SA-4.0

title: "Tutorial: How to become REUSE-compliant"
---

<!-- REUSE-IgnoreStart -->

This tutorial explains the basics of making a software project REUSE-compliant.
The goal is to **easily, comprehensively, and unambiguously** declare your
copyright and licensing in a way that is **machine-readable**. By the end of
this tutorial, you will understand the three fundamental steps of REUSE:

1. Choose and provide licenses
2. Add copyright and license information to each file
3. Confirm REUSE compliance

For the purpose of this tutorial, we will assume that the directory of your
project looks like this:

```
project/
├── src/
│   └── main.c
├── Makefile
└── README.md
```

If you would like to reproduce the steps in this tutorial on your own computer,
you can clone the [example
repository](https://codeberg.org/fsfe/reuse-tutorial-example). The branch
`non-compliant` matches the structure above, while the `compliant` branch is the
successful result of this tutorial.

For each of these steps, you will first learn how to achieve them manually.
However, the [REUSE tool](https://github.com/fsfe/reuse-tool) supports
you with most tasks, and the necessary commands will be listed as well in the
collapsible boxes. We recommend to first understand the basic principle before
just executing the tool's commands.

## 1. Choose and provide licenses {#step-1}

The first thing you need to do is to [choose a license]({{< relref
"faq.md#which-license" >}}). For this tutorial, we assume that you chose the GNU
General Public License (GPL) v3.0 or any later version. More than simply
choosing a license, you need to put the license in your project directory.

Find your license in the [SPDX License List](https://spdx.org/licenses/). SPDX
is an open standard for communicating license and copyright information. Each
license is uniquely identified by a shortform SPDX License Identifier. The SPDX
License Identifier for your chosen license is `GPL-3.0-or-later`.

Create a `LICENSES/` directory in your project root which will contain all the
licenses that you use in your project. In your case, this means creating a file
`GPL-3.0-or-later.txt` in this directory, which will contain the full license
text. The name of the file is an SPDX License Identifier. You can find the
license text for many Free Software licenses in the
[license-list-data](https://github.com/spdx/license-list-data/tree/master/text)
repository.

{{< box-tool >}}

[The `reuse download`
command](https://reuse.readthedocs.io/en/stable/man/reuse-download.html) enables
you to download a specific license. `reuse download GPL-3.0-or-later` would
fulfil the task described in the manual instructions above. Running `reuse
download --all` automatically downloads all licenses which the REUSE tool
detects as being used in your project.

{{< /box-tool >}}

## 2. Add copyright and licensing information to each file {#step-2}

Now that you have a license, you need to indicate in the relevant files that
these files fall under that license. Edit the comment header of
`src/main.c` as such:

```
/*
 * SPDX-FileCopyrightText: 2024 Jane Doe <jane@example.com>
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */
```

The `SPDX-FileCopyrightText` tag records the publication years and copyright
holder of the contents of the file. You can read more about [which publication
years to use]({{< relref "faq.md#years-copyright" >}}) and [what copyright
holders are]({{< relref "faq.md#copyright-holder-author" >}}) in the FAQ.

The `SPDX-License-Identifier` tag is followed by a [valid SPDX License
Expression](https://spdx.org/specifications), typically just the SPDX
License Identifier of the license.

Each file must always contain these two tags in the header. You are allowed to
use the `SPDX-FileCopyrightText` tag multiple times if you have multiple
copyright holders.

In the example project, you also edit `Makefile` and `README.md` using this
header information, but of course with corresponding comment syntax.

{{< box-tool >}}


[The `reuse annotate`
command](https://reuse.readthedocs.io/en/stable/man/reuse-annotate.html) helps
with adding licensing and copyright information to your files. For the task
above, the following command will do the job:

```bash
reuse annotate --copyright="Jane Doe <jane@example.com>" --license="GPL-3.0-or-later" src/main.c Makefile README.md
```

{{< /box-tool >}}

## 3. Confirm REUSE compliance {#step-3}

Having added a license to your repository and having added copyright and
licensing information to each file, your project tree will now look like this:

```
project/
├── LICENSES/
│   └── GPL-3.0-or-later.txt
├── src/
│   └── main.c
├── Makefile
└── README.md
```

To ensure that you did not miss anything, you should confirm REUSE compliance
with the REUSE tool. Follow the [installation
instructions](https://reuse.readthedocs.io/en/latest/readme.html#install)
available for multiple platforms, then go to the project directory and run the
linter.

```
$ reuse lint

# SUMMARY

* Bad licenses: 0
* Deprecated licenses: 0
* Licenses without file extension: 0
* Missing licenses: 0
* Unused licenses: 0
* Used licenses: GPL-3.0-or-later
* Read errors: 0
* Files with copyright information: 3 / 3
* Files with license information: 3 / 3

Congratulations! Your project is compliant with version 3.2 of the REUSE Specification :-)
```

As you can see in the last line, the tool confirms that your project is
compliant with REUSE now! To learn what the different criteria mean, please have
a look at the [documentation of the lint
command](https://reuse.readthedocs.io/en/stable/man/reuse-lint.html).

## More information

This tutorial was a lightning-quick introduction to REUSE. Not all use-cases are
covered here, especially [how to annotate uncommentable files]({{< relref
"faq.md#uncommentable-file" >}}) and [how to bulk-annotate files]({{< relref
"faq.md#bulk-license" >}}). In order to learn about these and more practical
use-cases, see the ['How do I ...' section in the Frequently Asked
Questions]({{< relref "faq.md#howto" >}}).

Other sources for more information:

- Our [Frequently Asked Questions](https://reuse.software/faq) covers common
  questions as well as extraordinary cases and will constantly be updated.
- The [REUSE Specification](https://reuse.software/spec) may aid you in gaining
  a full understanding of REUSE.
- The [REUSE tool documentation](https://reuse.readthedocs.io/) describes
  installation and usage of the REUSE tool.
- Our [help for developers](https://reuse.software/dev/) lists various
  resources for programmers like the tool, the API, or how to include
  checks in CI/CD workflows.

If none of the links above were able to answer your question, please contact us
by:

- opening an issue on [reuse-website](https://github.com/fsfe/reuse-website) for
  questions on the tutorial, FAQ or specification;
- opening an issue on [reuse-tool](https://github.com/fsfe/reuse-tool) for
  questions on the REUSE tool;
- or [sending an email to the FSFE](https://fsfe.org/contact). Please note that
  we would prefer issues because they are publicly searchable for other people.

Thank you for your valuable contribution towards making software reusable!

<!-- REUSE-IgnoreEnd -->
