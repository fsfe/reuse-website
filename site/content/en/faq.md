---
# SPDX-FileCopyrightText: 2019 Free Software Foundation Europe e.V.
# SPDX-License-Identifier: CC-BY-SA-4.0

title: "Frequently Asked Questions"
---

<!-- REUSE-IgnoreStart -->

This page lists common questions and their answers when dealing with licensing
and copyright, and with the adoption of REUSE specifically. Please note that
nothing here is legal advice.

{{< toc >}}

# General {#general}

## I am short on time. Can you give me the quickest possible summary? {#quick-summary}

We want to improve the way that people license their software projects such that
it is **easy, comprehensive, unambiguous, and machine-readable**. We propose
three steps to achieve this:

### 1. Choose and provide licenses {#step-1}

Choose a [Free Software](https://fsfe.org/about/basics/freesoftware) license
for your project. Find the SPDX identifier of your license in the [SPDX
License List](https://spdx.org/licenses/). Download the license text for your
license from the
[license-list-data](https://github.com/spdx/license-list-data/tree/master/text)
repository and put it in the `LICENSES/` directory.

### 2. Add copyright and licensing information to each file {#step-2}

Then, for all files, edit the header to contain the following:

```
# SPDX-FileCopyrightText: [year] [copyright holder] <[email address]>
#
# SPDX-License-Identifier: [identifier]
```

### 3. Confirm REUSE compliance {#step-3}

Use the [REUSE tool](https://github.com/fsfe/reuse-tool) to automate some of
these steps, and to check whether you did everything correctly.

## What is SPDX? {#what-is-spdx}

SPDX stands for [Software Package Data Exchange](https://spdx.org/). It is a
project by the [Linux Foundation](https://www.linuxfoundation.org/) and the rock
upon which REUSE is built. SPDX defines a standardised way to share copyright
and licensing information between projects and people. Most importantly for
REUSE, SPDX maintains the [SPDX License List](https://spdx.org/licenses/), which
defines standardised identifiers for a lot of licenses.

# Copyright {#copyright}

## What is copyright? {#what-is-copyright}

Copyright is a legal construct that grants someone exclusive rights over a
creative work. The most important exclusive right is in the name: The right to
produce copies. Only the copyright holder is allowed to give new copies of their
work to people. You do not need to do anything to gain copyright. As soon as you
make a creative work, you instantly gain copyright over it.

Usually the author is the copyright holder, but often copyright is transferred
to the author's employer.

Creative Commons provides a better and lengthier answer in their [Frequently
Asked
Questions](https://creativecommons.org/faq/#what-is-copyright-and-why-does-it-matter).

If you want others to be able to freely use, study and share your code, you must
release it under a license.

## Is there a standard format for declaring copyright? {#standard-copyright}

Generally, we recommend that you use `SPDX-FileCopyrightText: [year] [copyright
holder] <[contact address]>`. You may choose to drop items except the copyright
holder, which must always be included. We recommend that you include all items,
however.

The specification includes a section on the exact format of the copyright
notice. See [the specification](/spec) and [the next
question](#copyright-symbol).

## Do I use SPDX-FileCopyrightText, Copyright, or ©? {#copyright-symbol}

The specification lists the following copyright notices as valid:

```
SPDX-FileCopyrightText: 2019 Jane Doe <jane@example.com>
SPDX-FileCopyrightText: © 2019 John Doe <john@example.com>
SPDX-FileCopyrightText: Contributors to Example Project <https://project.example.com>
SPDX-FileCopyrightText: 2023 Alice Hack and (other) contributors to Project X <https://git.example.com/alicehack/projectx/CONTRIBUTORS.md>
SPDX-SnippetCopyrightText: (C) Example Cooperative <info@coop.example.com>
© Example Corporation <https://corp.example.com>
Copyright 2016, 2018-2019 Joe Anybody
Copyright (c) Alice, some rights reserved
```

Out of those, the first two are highly recommended. The others exist primarily
to be compatible with existing conventions.

<!-- TODO: Link to another question about © -->

## Which years do I include in the copyright statement? {#years-copyright}

Generally, there are four options for you to choose:

1. The year of initial publication.
2. The year of the latest publication.
3. All years of publications, either as range (e.g., 2017-2019) or as separate
   entries (e.g., 2017, 2018, 2019).
4. Do not include any year.

Which option you choose is ultimately up to you. [This
article](https://matija.suklje.name/how-and-why-to-properly-write-copyright-statements-in-your-code)
makes a good case for using the year of initial publication of the file.

## Which files are copyrightable? {#what-is-copyrightable}

All files that are original works of authorship are copyrightable. In essence,
if someone sat down typing their own original thoughts on a keyboard, then that
person holds copyright over the output. Common examples are source code,
documentation, audio, and video.

There are some edge cases, however. For instance, the program `print("Hello,
REUSE!")` probably does not meet the threshold of originality. Similarly, data
files and configuration files may not meet that threshold either. For these
files, see [this question](#uncopyrightable).

## What is a copyright holder, and what is an author? {#copyright-holder-author}

In these resources, we maintain a distinction between the copyright holder and
the author. The author (also known as creator) is the person who sat down and
created a work. Think of the author as a programmer, writer, or artist.

The copyright holder is the person who has the exclusive rights over that work.
Often the author and the copyright holder are the same. However, if the author
is being paid by their employer to create a work, the employer is often the
copyright holder.

Keep in mind that in some jurisdictions, the word "author" is often used as a
synonym for "copyright holder". In other jurisdictions, authors maintain some
rights over their work even if they are not the copyright holder.

## I changed a single line of code. Should I add an SPDX-FileCopyrightText tag with my name? {#when-copyright}

The core question here is: At what point should I consider myself a copyright
holder over a file? This is up to your discretion. It might help to be
consistent and add the tag to every file you touch, but it is perhaps more
valuable to reach a consensus about this within your project.

# Licensing {#licensing}

## What is a license? {#what-is-license}

One problem with copyright as it pertains to software is that it makes software
unshareable by default. A license changes that. A license defines the terms
under which the copyright holder allows the recipient of the license to use the
software.

If the license allows the recipient to [use, study, share and
improve](https://fsfe.org/freesoftware/basics/4freedoms.html) the software, then
that software is [Free Software](https://fsfe.org/about/basics/freesoftware).

## What is a copyleft license? A permissive license? {#copyleft-permissive-license}

There are two broad categories of Free Software licenses; copyleft and
permissive licenses.

A copyleft license give you the right to use, study, share, and improve a piece
of software under one strict condition. If you make any changes to the program
and share your version of the program with someone else, you must share your
changes under the same license as the original. A well-known copyleft license is
the [GNU General Public License version
3](https://www.gnu.org/licenses/gpl-3.0.html).

A permissive license gives you the same Free Software rights, but does not
include this condition. It is possible for someone to take a permissively
licensed piece of software, make changes to it, and keep the changed version
proprietary. A well-known permissive license is the [Apache License, version
2](https://www.apache.org/licenses/LICENSE-2.0.html).

## Which license should I choose? {#which-license}

Always choose a Free Software license, i.e. a license that gives the recipient
the freedom to use, study, share, and improve the software. Aside from that, the
license you choose is up to you. If you are contributing to an existing project,
you should release your changes under the same license as the project.
Otherwise, the [Free Software
Foundation](https://www.gnu.org/licenses/license-recommendations.html),
[choosealicense.com](https://choosealicense.com/), and
[joinup.eu](https://joinup.ec.europa.eu/collection/eupl/joinup-licensing-assistant-jla)
have some good recommendations. Note that these resources each emphasise a
different value, and come with their own biases.

Above all, if you value freedom, you should choose a license that makes your
software [Free Software](https://fsfe.org/about/basics/freesoftware.en.html).

## What are license exceptions and what do I do with them? {#license-exceptions}

License exceptions are additions or alterations to a license that often work to
permit a certain use of the code that wouldn't be allowed under the original
license. It is often used by compilers, where a portion of compiler code may end
up in the resulting binary. The exception may waive rights over portions of code
that end up in binaries.

Exceptions are treated almost identically to licenses. In order to combine a
license with an exception, you mark a file with the following tag:
`SPDX-License-Identifier: GPL-3.0-or-later WITH GCC-exception-3.1`.

You can find a list of common exceptions at [SPDX License
Exceptions](https://spdx.org/licenses/exceptions-index.html).

## How does license compatibility work? {#license-compatibility}

Free Software licenses often differ in detail, but always give you the right to
use, study, share, and improve the software. Many licenses are compatible,
meaning that you can use code from multiple licenses in the same project and
still be able to respect the terms of each license simultaneously.

Some licenses are [less permissive than others](#copyleft-permissive-license),
meaning that a combined work containing code under both licenses must
effectively respect the terms of the least permissive license.

Some licenses have mutually exclusive requirements. For example, the
[CC-BY-NC-4.0](https://creativecommons.org/licenses/by-nc/4.0/) license has a
clause that disallows a work to be used for commercial purposes, and the
[GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.html) has a clause that
says that you may not impose additional restrictions that aren't in the GPL
license. Because the GPL license has no clause regarding commercial purposes,
these two licenses cannot be respected simultaneously, and they are considered
incompatible.

Exactly which licenses are compatible is a difficult question, and it also
depends on what you want. Integrating work that is licensed differently may mean
having to respect license terms which you do not want to respect.

Specifically as pertains to the GNU GPL, [this GNU
article](https://www.gnu.org/licenses/license-compatibility.html) and [GNU's
license list](https://www.gnu.org/licenses/license-list.html) may help you work
out compatibility.

It is important to note that REUSE does not help you resolve license
compatibility. REUSE's goal is to help you comprehensively declare your
licensing metadata, not to check whether that metadata is correct or valid. You
need different tools and processes for that.

## Where else do I put my license information? {#where-else}

Marking all individual files with `SPDX-License-Identifier` tags goes a long way
towards unambiguously communicating the license information of your project, but
it helps to communicate the license information in natural language as well. In
the README of your project, feel free to provide a summary of the licensing
information, or simply redirect the reader to your `LICENSES/` directory.

Additionally, many package hosting sites expect that you declare the licensing
information of your package. For instance, the [pyproject.toml file of the REUSE
tool](https://github.com/fsfe/reuse-tool/blob/main/pyproject.toml) declares
all the licenses that it uses in the format expected by the Python packaging
infrastructure.

## I only have a single license file. Should I still create a LICENSES directory? {#single-license}

Yes. This may seem extraneous, but it prevents future confusion when differently
licensed code is adopted. By keeping all licenses in a single directory, it is
easy for a user of your program to find all the licenses they need to comply
with in the blink of an eye.

However, in addition to that, you can keep your `LICENSE`/`COPYING` file if you
want. See [this question](#tradition).

## Should I put comment headers in my license files? {#header-in-license}

You should not edit license files. Please see [this question](#edit-license).

## Should I edit my license files? {#edit-license}

You should never edit license files. When you use an existing license, you
should always copy it verbatim.

Some licenses, such as MIT and the BSD family of licenses, have a line that says
"Copyright (c) [year] [copyright holder]". Please see [this
question](#license-templates) about how to deal with those licenses.

There are many reasons for why you should not alter license texts, but if you do
alter the texts, you should use a different SPDX identifier for this license.
See [this question](#custom-license).

## Can I edit copyright notices and license disclaimers? {#edit-copyright-and-licensing}

If you find out that some information is incorrect, you are free to adjust it.
Otherwise, it is usually a good idea to leave copyright notices and license
disclaimers intact. But there is no one-size-fits-all answer here.

## Can I remove the license and copyright information from minified code (e.g., JavaScript)? {#minified}

You can, but you probably should not. Many minifiers have an option that allows
you to retain the header comment. If this option is present, you should use it,
especially if you use a license that mandates that you include a license
disclaimer.

## Do I need to include both GPL-3.0-or-later and GPL-3.0-only in my repository? {#gpl-plus}

Members of the GPL family are listed separately in the SPDX License List as
-only and -or-later, even though the license texts are identical. If you have
code under only one of these licenses, we recommend that you only include that
one license.

If you have code under both an -only license and an -or-later license, we
recommend that you include both licenses separately.

## If I use exclusively LGPL-3.0-or-later, should I also include the GPL-3.0-or-later text? {#lgpl-only}

The LGPL license text is an addendum to the GPL license text. If you provide
_only_ the LGPL license text to your downstream, you are effectively not
providing them with the full license. For that reason, you should also provide
the GPL-3.0-or-later license in your `LICENSES/` directory. The REUSE linter may
complain that none of your files use the GPL-3.0-or-later license. To solve
that, pick one file to be licensed under `LGPL-3.0-or-later OR GPL-3.0-or-later`.

## Does REUSE help me with the licenses of my dependencies? {#dependencies-licenses}

No, that is out of scope for REUSE. If you need to check whether your project
respects the licenses of all its dependencies, or whether you didn't
inadvertently pull in a dependency with an unwanted license, you need different
tools and processes. Some tools listed on the [comparison page]({{< ref
"/comparison.md" >}}) may help you.

# How do I ... {#howto}

## ... install the REUSE tool? {#install-tool}

See the installation instructions and accompanying tool documentation at
<https://reuse.readthedocs.io/en/stable/readme.html#install>. The short of it
is:

```
$ pipx install reuse
$ pipx ensurepath
$ reuse --help
```

## ... create a software bill of materials {#bill-of-materials}

Install the reuse tool and run `reuse spdx -o reuse.spdx` in the project root
to create an [SPDX
document](https://spdx.dev/use/specifications/).

## ... add copyright and licensing information to an uncommentable file? {#uncommentable-file}

Binary files such as images or videos or certain text files such as JSON cannot
be commented with a REUSE header, but they should still have copyright and
licensing information.

There are two ways of associating information with such a file:

1. Add a file next to it with the suffix `.license` (e.g. `cat.jpg.license` for
   a file called `cat.jpg`) and write the comment header in that file. The
   contents of the original file are subsequently ignored, which may be handy in
   some cases.
2. License the file via [`REUSE.toml`](#bulk-license), a REUSE configuration file.

## ... bulk-license whole directories? {#bulk-license}

Where possible, you should add REUSE headers to every file. However, there are
some scenarios where it is undesirable or impossible to add a REUSE header to
every single file in a directory. For example:

- You are not allowed to edit the files (because they are test files, or come
  from a third party).
- Adding `.license` files would break the build system, especially for images
  and video.

You can license files globally using the `REUSE.toml` file, typically placed in
the root of your project, but it can be placed anywhere relative to the files.
An example of the file follows:

```toml
version = 1

# A simple glob of all files in resources/img/
[[annotations]]
path = "resources/img/*"
SPDX-FileCopyrightText = "2024 Jane Doe <jane@example.com>"
SPDX-License-Identifier = "CC0-1.0"

# All files in resources/vid/, with multiple copyright holders
[[annotations]]
path = "resources/vid/*"
SPDX-FileCopyrightText = [
    "2024 Jane Doe <jane@example.com>",
    "2024 John Doe <john@example.com>"
]
SPDX-License-Identifier = "CC-BY-4.0"

# A recursive glob of all files and directories in tests/resources/,
# and the REUSE information of these files is overridden.
[[annotations]]
path = "tests/resources/**"
precedence = "override"
SPDX-FileCopyrightText = "2024 Jane Doe <jane@example.com>"
SPDX-License-Identifier = "CC0-1.0"

# Two computer-generated files.
[[annotations]]
path = [
    "poetry.lock",
    "requirements.txt"
]
SPDX-FileCopyrightText = "NONE"
SPDX-License-Identifier = "CC0-1.0"
```

The [REUSE Specification](/spec) documents more thoroughly how `REUSE.toml` can
be used. You can find a JSON schema for `REUSE.toml` at
<https://reuse.software/reuse-toml-v1.schema.json>.

## ... override erroneous REUSE information? {#override-info}

You may have a file that contains copyright or licensing tags that are wrong.
This may be on purpose, or maybe you have good reasons not to edit these files.
You have a few options to instruct REUSE to ignore the erroneous information and
to use correct information instead.

1. Use [the `REUSE-IgnoreStart` and `REUSE-IgnoreEnd` tags](#exclude-lines)
   inside of the file.
2. Use [a `.license` file to override the contents of the
   file](#uncommentable-file).
3. Use [a `REUSE.toml` file](#bulk-license) with the `precedence = "override"`
   key-value.

<!-- REUSE-IgnoreStart -->

## ... add additional REUSE information to a file without editing the header? {#aggregate-info}

There is a specific corner case where a file may contain valid REUSE information
(usually copyright holders), but it is not desirable for you to edit this file's
comment header by hand, even though there is more information that should apply
to this file. A good example of this corner case is `.po` files provided by
translators. These may or may not contain copyright and licensing information,
depending on the translator's translation software and settings.

You can add additional information using the `precedence = "aggregate"`
key-value in your [`REUSE.toml` file](#bulk-license). An example looks like
this:

```toml
[[annotations]]
path = "po/*.po"
precedence = "aggregate"
SPDX-FileCopyrightText = "Contributors to My Project"
SPDX-License-Identifier = "GPL-3.0-or-later"
```

In the above example, 'Contributors to My Project' is added to the file's
copyright holders (if any), and 'GPL-3.0-or-later' is added to the file's
licenses (if any).

## ... copy someone else's work? {#copy-work}

If someone else has made their work available for you to use and copy, you can
incorporate their work into your project. When you put the work in one of the
files in your project, you should add an `SPDX-FileCopyrightText` tag for the copyright
holder(s) and an `SPDX-License-Identifier` tag for the license(s) under which
the work was made available.

If the work was licensed differently from your project, you should [verify
whether the licenses are compatible](#license-compatibility), and add the new
licenses to your project.

## ... copy a work published under a pseudonym or nickname? {#copy-pseudonym}

You can list the pseudonym as the copyright holder. Some projects do not allow
pseudonymous contributions.

## ... copy a work that has no copyright notice or license? {#no-copyright-license}

Before you proceed, always first make sure that you can find the copyright and
licensing information elsewhere. Some projects only include this information in
the root directory or in their README file.

If you can find no copyright notice, you can try to add it yourself by divining
the copyright holder from the author. See [this
question](#copyright-holder-author) for more information on the distinction.
When in doubt, contact the author for clarification.

It may be that the author wishes to remain anonymous, which is their right. You
can write [`NONE` or `NOASSERTION` as the copyright
holder](https://spdx.github.io/spdx-spec/v2.3/file-information/#88-copyright-text-field).

If the work has no license, then that means that you do not have the right to
copy it. If you believe that this is a mistake and the author clearly meant for
you to be able to copy this work, you should contact the author and ask them to
license their work. Feel free to refer them to <https://reuse.software>.

## ... exclude a file from REUSE compliance testing? {#exclude-file}

If the file is a build artifact and you use Git, simply make sure that the file
is covered by your `.gitignore` file. The same goes for other VCS ignore
mechanisms.

Otherwise, you cannot exclude files from REUSE compliance testing. It would go
entirely against the purpose of REUSE: making sure that every file has a
copyright and license tag.

If you really want to exclude a file, consider using the
[CC0-1.0](https://creativecommons.org/publicdomain/zero/1.0/) license for this
file. By doing this, you put the file in the [public domain, or your country's
equivalent](https://fsfe.org/freesoftware/legal/faq.html#public-domain).

If you have an entire directory that you want to "exclude" from REUSE compliance
testing, you can [use `REUSE.toml`](#bulk-license).

## ... exclude certain lines from REUSE compliance testing? {#exclude-lines}

In order to make the tool ignore a specific section containing strings that may
falsely be detected as copyright or license statements, you can wrap it within
the two comments `REUSE-IgnoreStart` and `REUSE-IgnoreEnd`.

<!-- REUSE-IgnoreStart -->

Please note that this must not be used to ignore valid copyright and licensing
information by yourself or a third party. The ignore blocks must only be used
for marking blocks that may trigger false-positive detections and errors.

An example for a file that contains commands or documentation that confuse the
REUSE tool:

```bash
# SPDX-FileCopyrightText: 2021 Jane Doe
#
# SPDX-License-Identifier: GPL-3.0-or-later

echo "SPDX-FileCopyrightText: $(date +'%Y') John Doe" > file.txt
echo "SPDX-License-Identifier: MIT" >> file.txt
```

This is how the section can be ignored:

```bash
# SPDX-FileCopyrightText: 2021 Jane Doe
#
# SPDX-License-Identifier: GPL-3.0-or-later

# REUSE-IgnoreStart
echo "SPDX-FileCopyrightText: $(date +'%Y') John Doe" > file.txt
echo "SPDX-License-Identifier: MIT" >> file.txt
# REUSE-IgnoreEnd
```

<!-- REUSE-IgnoreStart -->

## ... deal with uncopyrightable files? {#uncopyrightable}

Some files, such as those generated by code, or config files which contain no
creative expression, may not be copyrightable. However, REUSE mandates licensing
information for every single file, so there is a conflict here. Because we [do
not allow excluding files](#exclude-file), some information must be recorded for
such files.

You have two options:

1. Simply use your regular copyright and license for this file. There is nothing
   that stops you from "claiming" copyright over your own works, even if a court
   might hypothetically find such files uncopyrightable.
2. Waive your copyright using the
   [CC0-1.0](https://creativecommons.org/publicdomain/zero/1.0/) license or
   another similar public domain dedication.

You may choose to use a copyright tag such as `SPDX-FileCopyrightText: NONE`
to assert that there is no copyright holder.

The reason that these files _must_ be licensed is because reasonable minds can
differ about the threshold of originality. You may consider a file so
insignificant that it does not merit licensing information, but downstream may
disagree and believe that the file in question falls under copyright,
effectively disallowing them from using it if there is no license.

It is important to note that you can only apply licenses to your own works. If
the file was authored by someone else, you should declare their copyright and
license in the header. If there is no such information, you should contact the
author.

## ... separately declare the copyright and license of a part of a file? {#partial-license}

It may happen that you copy some third-party code into a bigger file. You can
add the copyright and licensing to the file's header, or you can add in-line
snippet comments around this new block of code.

Such an annotated snippet block must start with `SPDX-SnippetBegin` to mark its
beginning and end with `SPDX-SnippetEnd` to mark the snippet's end.

Do note that SPDX tags must start with `SPDX-Snippet` inside of snippets,
meaning that the (only) correct copyright notice in a snippet is
`SPDX-SnippetCopyrightText`. `SPDX-License-Identifier` is an exception.

Example:

```
# SPDX-SnippetBegin
# SPDX-License-Identifier: MIT
# SPDX-SnippetCopyrightText: 2023 Jane Doe <jane@example.com>

{$snippet_code_goes_here}

# SPDX-SnippetEnd
```

Snippets may nest, and this is denoted by having
`SPDX-SnippetBegin`/`SPDX-SnippetEnd` pairs within other pairs, in the same way
that parentheses nest in mathematical expressions. In the case of nested
snippets, the SPDX file tags are considered to apply to the inner-most snippet. Example:

```
# SPDX-SnippetBegin
# SPDX-License-Identifier: MIT
# SPDX-SnippetCopyrightText: 2023 Jane Doe <jane@example.com>

{$snippet_code_under_MIT}

# SPDX-SnippetBegin
# SPDX-License-Identifier: BSD-2-Clause
# SPDX-SnippetCopyrightText: Copyright Example Company

{$snippet_code_under_BSD-2-Clause}

# SPDX-SnippetEnd

{$more_snippet_code_under_MIT}

# SPDX-SnippetEnd
```

It is also considered good practice to further specify the origin of the
snippet, for instance by a comment like "The class Foo is copied from project Bar".

A possible alternative to using snippets is to extract the code block from the
file, and to keep it in its own file.

## ... use a license that is not on the SPDX License List? {#custom-license}

If you have a custom or modified license that does not appear in the SPDX
License List, place your license in the file
`LICENSES/LicenseRef-MyLicense.txt`. By naming your license with the prefix
`LicenseRef-`, tools that speak SPDX will still be able to recognise your
license.

In this example, the header in files covered by this custom license may look
like the following:

```
# SPDX-License-Identifier: LicenseRef-MyLicense
# SPDX-FileCopyrightText: 2017 Jane Doe <jane@example.com>
```

This may also be necessary when dealing with multiple different variants of
[customisable license text files like MIT or BSD](#license-templates).

Please note: It is strongly advised to [use established and approved
licenses](#which-license).

## ... use a custom license exception? {#custom-exception}

It is not possible to create a custom exception. Instead, you may [create a
custom license](#custom-license) that embeds the exception.

## ... properly declare multi-licensing? {#multi-licensing}

You should always include all licenses in the `LICENSES/` directory.

The correct SPDX license expression that applies to the file depends on the
intent. If all the code within is licensed under multiple licenses, and the
licensee can choose under which license they consume the work, use
`SPDX-License-Identifier: MPL-1.1 OR GPL-2.0-or-later OR LGPL-2.1-or-later`, as
parts of Firefox do.

If all the code within the file is licensed under multiple licenses, and the
user must comply with all licenses simultaneously, use
`SPDX-License-Identifier: LGPL-2.0-or-later AND AML`, as can be found in Simple
DirectMedia Layer (SDL).

If all the code within the file is licensed under either one license or another
(for instance, all code is under GPL-2.0-only, but one function is under MIT),
use [snippets](#partial-license).

<!-- TODO: bump SPDX spec -->

You can read more about SPDX expressions [in the
specification](https://spdx.github.io/spdx-spec/v2.3/SPDX-license-expressions/).

## ... deal with license texts which include copyright statements, like MIT/BSD? {#license-templates}

Some license texts, such as MIT or the BSD family of licenses, can be modified
to contain custom copyright notices.

If you are releasing code under such a license, we recommend that you add the
license text to the project without any modifications whatsoever. A good way of
obtaining the unmodified license text is using the REUSE helper tool (e.g.,
`reuse download MIT`). Instead of inserting your copyright notice into the
license text itself, you add copyright statements to your project's files
following the normal REUSE best practices.

When you reuse code from multiple sources that use an MIT/BSD license, you
quickly run into a problem. Both the MIT license and the BSD family of licenses
include a clause that requires the redistributor (that's you) to reproduce the
copyright notice and the license text. For instance, Project A and Project B
might both use an MIT license, but the actual license files will differ because
they have different copyright notices embedded within them. If you want to reuse
code from both of these projects, you might not be sure where to put your copies
of those projects' license files.

We recommend two options:

1. The most pragmatic solution is to put the unmodified license text (i.e., the
   license text template without any copyright notices) in your `LICENSES/`
   folder. You then embed the copyright notices of the upstream project into the
   corresponding source code files you reused, as usual.
2. The more thorough and labour-intensive solution is to treat any of these
   license texts with modified copyright notices as a [custom license using
   LicenseRef](#custom-license). However, if you reuse code from many third
   parties under these licenses, you may end up with a lot of these custom
   licenses.

## ... deal with a file that has been edited by many people? {#many-copyright-statements}

Some files are edited by many people and would have an extremely long list of
copyright holders in the header. This may be aesthetically unpleasing, but is
not incorrect.

If you would rather not deal with having so many copyright notices, some
projects such as Chromium circumvent this problem by using "Copyright (c) 2013
The Chromium Authors" as their copyright tag. You may consider doing this, but
then you should keep a list of copyright holders and authors in a separate file
in your project.

# Why REUSE

## Do I really need to include the license and copyright headers in all files? Why should I care? {#why-care}

Big projects with complex copyright and licensing stand the most to gain from
REUSE by shaping order out of chaos and disambiguating unclear licensing.
Putting a header in every single file is a necessary evil to obtain that order
and clarity. This metadata needs to be somewhere, and we are opined that it
should be as close to the data as possible---as a header in each file.

But even smaller projects or projects with simple licensing benefit from REUSE.
For good or for ill, licensing is a cornerstone of the Free Software movement.
It is what enables sharing, and in the case of copyleft, it enables us to keep
software Free. Getting licensing right is important, or else people won't be
able to use your software, and REUSE is a simple component in helping you with
this.

Furthermore, even if your project is simple _now_, it may not always be so. If
you copy some code from another project that is differently licensed, you are
often obliged to attribute correctly and/or provide the accompanying license
text. By implementing REUSE early, it is a lot easier to discern your code from
third-party code and correctly keep track of these things.

Lastly, implementing REUSE is a small service to others. As a software engineer,
it can be frustrating when you find some code that is purpose-built for the
problem you are trying to solve, but you are unable to figure out the licensing
of that code, effectively making it impossible to, well, reuse that code. REUSE
helps you help other developers in reusing your code, which is one of the great
boons of Free Software.

## I'm used to doing things differently; can't I just keep doing what I have always been doing? {#tradition}

Some people, when they first encounter REUSE, run into a couple of things that
are very different from what they are used to. They miss the long legal blurbs
at the tops of files, miss the `COPYING`/`LICENSE` file in the root of the
repository, think that `.license` files clutter the directory, or find it very
strange that even insignificant non-code files get licensing headers. The
different-ness of REUSE can seem peculiar in that way.

One of REUSE's main goals is to be as compatible to existing best practices as
possible. It explicitly breaks with some old traditions, however. We believe
that REUSE is better for it. By breaking new ground, REUSE is simpler, more
comprehensive, and more unambiguous than it would have been if we tried to
maintain compatibility with traditions of old.

Nothing prevents you from adding long legal blurbs to your headers or putting a
`COPYING` file in the root of your directory _anyway_ though. These things can
be done to your liking. Some other aspects of REUSE are unavoidable, however.
REUSE maintains that _every single file should contain licensing information_,
so that even the tiniest of files have licensing metadata. These things are
simply inherent to the goal of REUSE, and we hope that these eccentricities will
soon become commonplace, such that they would no longer seem so peculiar
anymore.

## Why doesn't REUSE use the metadata fields in pictures, SVG, text documents etc.? {#metadata}

Several file formats support the storage of metadata information within the file
itself, and some even contain fields for copyright and license. However, we do
not support these in REUSE for practical reasons:

1. For humans and machines alike it's not always trivial to spot this
   information. REUSE intends to make it simple to find licensing and copyright
   information.
2. Some tools redact metadata fields, for example to make files smaller or
   remove potentially sensible personal information. This could also wipe your
   or someone else's copyright information, and detecting this mistake is hard.
3. With some file types, there are competing and unstandardised methods to store
   metadata.

This question is also related to [why we cannot use version control to record
copyright](#vcs-copyright).

## Why doesn't REUSE use version control to record copyright? {#vcs-copyright}

In [a different question](#copyright-holder-author), we distinguish between
copyright holders and authors, which are not always the same. Version control
typically only records authorship, which makes it unsuitable for the task of
recording copyright.

Another obstacle is that version control history may contain errors, and fixing
such an error would require rewriting the history, causing all contributors to
have to re-download the new trunk.

A further issue with version control is that the `blame` command that is
typically (mis)used to find authorship line-by-line shows only the author of the
last commit in that line, even if it was just something as trivial as fixing a
typo or moving a block of code to a different location.

## What happened to `.reuse/dep5`? {#dep5-history}

REUSE currently uses [`REUSE.toml` to bulk-license files](#bulk-license). But
before version 3.2 of the specification, REUSE used `.reuse/dep5`, an
almost-verbatim copy of
[DEP5/`debian/copyright`](https://www.debian.org/doc/packaging-manuals/copyright-format/1.0/).

In version 3.2, `.reuse/dep5` is deprecated but still supported, although
mutually exclusive with `REUSE.toml`. You can use `reuse convert-dep5` to
automatically convert a `.reuse/dep5` file to a semantically equivalent
`REUSE.toml` file.

`.reuse/dep5` was dropped in favour of `REUSE.toml` for various reasons:

- `debian/copyright` was never a purposive match for REUSE. Debian uses this
  file to holistically declare the licensing of a package; REUSE uses it to fill
  the licensing gaps.
- `.reuse/dep5` was ambiguous on the licensing information of a file if its
  information was declared both in the file itself and in `.reuse/dep5`. Which
  information is applied? In version 3.2, this information is explicitly
  aggregated. Adding a new key to explicitly declare precedence would have been
  difficult, because...
- `.reuse/dep5` is hard to parse. There is a Python module in
  [python-debian](https://salsa.debian.org/python-debian-team/python-debian),
  but the format is custom and inflexible. One of REUSE's core aims is to be
  machine-readable, and this custom format was not conducive to that end.
- TOML is more flexible. You can write any key-value that you want, which may be
  helpful for custom workflows.
- TOML is much easier to write. Developers already know how to write TOML, and
  don't need to accustom themselves to a custom format.
- `REUSE.toml` can be placed anywhere relative to the files, and can nest. This
  is a big help for monorepos or monorepo-like projects.

For compatibility, `.reuse/dep5` will remain supported in spite of its
deprecation for a considerable length of time; at least until 2029.

<!-- REUSE-IgnoreEnd -->
