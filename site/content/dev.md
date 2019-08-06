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

Compliant projects may use the REUSE badge. You can use the URL `https://reuse.software/badge/reuse-compliant.svg` as image source when including the badge in your project. Please link it to `https://reuse.software` so people can learn about its meaning.

[![REUSE compliant](/badge/reuse-compliant.svg)](https://reuse.software)

Here is a snippet that you can use for your README.md file:

`[![reuse compliant](https://reuse.software/badge/reuse-compliant.svg)](https://reuse.software)`

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
