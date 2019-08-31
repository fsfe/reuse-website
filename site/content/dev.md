---
# SPDX-FileCopyrightText: Free Software Foundation Europe e.V.
# SPDX-License-Identifier: CC-BY-SA-4.0

title: "Help for developers"
---

Licensing should be easy for developers. We provide several tools and services to allow you to concentrate on coding.


## Helper Tool {#tool}

The [REUSE helper tool](https://git.fsfe.org/reuse/tool) assists with achieving and confirming REUSE compliance. It downloads the full license texts, adds copyright and license information to file headers, and contains a linter to identify problems. Eventually, you can generate a software bill of materials.

Read the [documentation](https://reuse.readthedocs.io) to learn more about the tool. You will also find a [tool section in our FAQ](/faq/#tool) for the most pressing questions.


## Example repositories {#repos}

What does a REUSE-compliant project look like? The following repositories are basic, but each of them is REUSE-compliant. We make them available to demonstrate how REUSE works in practice.

- [reuse-example](https://git.fsfe.org/reuse/example) - a REUSE compliant repository showing a few methods to add copyright and licensing information. Includes a non-compliant branch for testing. This project is the basis for [our tutorial](/tutorial).
- [reuse-tool](https://git.fsfe.org/reuse/tool) - the helper tool itself is compliant.

## REUSE badge {#badge}

If your project is compliant with REUSE, you may want to show it off with the
REUSE badge. There are two types of badges for you to choose from: A static and
dynamic badge.

The static badge is a direct link to
`https://reuse.software/badge/reuse-compliant.svg` as image source. This badge
will show that your project is compliant without performing checks of any kind.
This works as an honour system.

Here is a snippet that you can use for your README.md file:

`[![REUSE compliant](https://reuse.software/badge/reuse-compliant.svg)](https://reuse.software)`

[![REUSE compliant](/badge/reuse-compliant.svg)](https://reuse.software)

Alternatively, you may use a dynamic badge, which changes depending on whether
your project is compliant or not. To get started with the dynamic badge, you
must first register your project at <https://api.reuse.software/register/>. Once
you have done this, you can use `https://api.reuse.software/badge/<url>` as
image source.

Here is a snippet example for the helper tool:

`[![REUSE](https://api.reuse.software/badge/git.fsfe.org/reuse/tool)](https://reuse.software)`

This snippet will display one of the following badges, depending on whether the
tool is compliant or not, or whether the API still needs to figure it out:

![compliant](/badge/reuse-compliant.svg)
![non-compliant](/badge/reuse-non-compliant.svg)
![checking](/badge/reuse-checking.svg)

<!-- FIXME: That documentation is currently not user-friendly at all. Once good
documentation exists, link to that instead. -->

The API can also be used to implement your own badge system. For more
information on the dynamic badge API, please read the documentation at
<https://git.fsfe.org/reuse/api>.


## Inclusion in CI/CD workflows {#ci}

REUSE can be easily integrated into your existing CI/CD processes to continuously test your repository and its changes for REUSE compliance.

The FSFE offers a Docker image which can be used in numerous CI solutions. Find a few examples below:

### Drone

Include the following snipped in your `.drone.yml` file:

```
pipeline:
  reuse:
    image: fsfe/reuse:latest
    commands:
      - reuse lint
```

More information about Drone on [drone.io](https://drone.io).

### GitLab

Include the following snipped in your `.gitlab-ci.yml` file:

```
reuse:
  image: fsfe/reuse:latest
  script:
    - reuse lint
```

More information about GitLab's CI on [docs.gitlab.com](https://docs.gitlab.com/ce/ci/quick_start/).

### Travis CI

Include the following snipped in your `.travis.yml` file:

```
language: minimal

services:
  - docker

before_install:
- docker pull fsfe/reuse:latest
- docker run --name reuse -v ${TRAVIS_BUILD_DIR}:/repo fsfe/reuse /bin/sh -c "cd /repo; reuse lint"
```

More information on Travis CI on [travis-ci.com](https://travis-ci.com).
