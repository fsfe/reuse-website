---
# SPDX-FileCopyrightText: Free Software Foundation Europe e.V.
# SPDX-License-Identifier: CC-BY-SA-4.0

title: "Help for developers"
---

Licensing should be easy for developers. We provide several tools and services to allow you to concentrate on coding.

Contents: [Helper tool](#tool), [example repositories](#repos), [REUSE API](#api), [CI/CD workflows](#ci)


## Helper Tool {#tool}

The [REUSE helper tool](https://git.fsfe.org/reuse/tool) assists with achieving and confirming REUSE compliance. It downloads the full license texts, adds copyright and license information to file headers, and contains a linter to identify problems. Eventually, you can generate a software bill of materials.

Read the [documentation](https://reuse.readthedocs.io) to learn more about the tool. You will also find a [tool section in our FAQ](/faq/#tool) for the most pressing questions.


## Example repositories {#repos}

What does a REUSE-compliant project look like? The following repositories are basic, but each of them is REUSE-compliant. We make them available to demonstrate how REUSE works in practice.

- [reuse-example](https://git.fsfe.org/reuse/example) - a REUSE compliant repository showing a few methods to add copyright and licensing information. Includes a non-compliant branch for testing. This project is the basis for [our tutorial](/tutorial).
- [reuse-tool](https://git.fsfe.org/reuse/tool) - the helper tool itself is compliant, just like [all other REUSE repositories](https://git.fsfe.org/reuse/).

Consider registering your project with the [REUSE API](#api) to include a dynamic compliance badge.


## API {#api}

The [REUSE API](https://api.reuse.software) helps you to continuously check and display compliance with the REUSE guidelines. You can include a badge indicating the live status in your README file, and parse the output using the generated JSON file.

This is how the badge will look like for a REUSE compliant project. You can click on the badge to see more information: [![REUSE status](https://api.reuse.software/badge/git.fsfe.org/reuse/api)](https://api.reuse.software/info/git.fsfe.org/reuse/api)

The API is the perfect tool for everyone who wants to show that their repository follows best practices in providing licensing and copyright information. It allows third-party services to integrate the live REUSE status, and offers a simple alternative for people who do not want to install the [REUSE helper tool](#tool) for a first quick check.

As everything else in REUSE, the API is [publicly available](https://git.fsfe.org/reuse/api) under Free Software licenses.


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
