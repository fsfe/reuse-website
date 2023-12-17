---
# SPDX-FileCopyrightText: 2020 Free Software Foundation Europe e.V.
# SPDX-FileCopyrightText: © 2020 Liferay, Inc. <https://liferay.com>
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


## Pre-commit hook {#pre-commit-hook}

You can automatically run `reuse lint` on every commit as a pre-commit hook for Git. This uses [pre-commit](https://pre-commit.com/). Once you [have it installed](https://pre-commit.com/#install), add this to the `.pre-commit-config.yaml` in your repository:

```yaml
repos:
-   repo: https://github.com/fsfe/reuse-tool
    rev: v2.1.0
    hooks:
    - id: reuse
```

Then run `pre-commit install`. Now, every time you commit, `reuse lint` is run in the background, and will prevent your commit from going through if there was an error.


## Inclusion in CI/CD workflows {#ci}

REUSE can be easily integrated into your existing CI/CD processes to continuously test your repository and its changes for REUSE compliance.

The FSFE offers a Docker image which can be used in numerous CI solutions. Find a few examples below:

### Drone

Include the following snippet in your `.drone.yml` file:

```
steps:
- name: reuse
  image: fsfe/reuse:latest
```

More information about Drone on [drone.io](https://drone.io).

### GitHub

GitHub users can integrate the REUSE action in their workflow. Visit the [action's marketplace page](https://github.com/marketplace/actions/reuse-compliance-check) for usage instructions.

More information about GitHub Actions on [help.github.com](https://help.github.com/en/actions/automating-your-workflow-with-github-actions).

### GitLab

Include the following snippet in your `.gitlab-ci.yml` file:

```
reuse:
  image:
    name: fsfe/reuse:latest
    entrypoint: [""]
  script:
    - reuse lint
```

More information about GitLab's CI on [docs.gitlab.com](https://docs.gitlab.com/ce/ci/quick_start/).

### Travis CI

Include the following snippet in your `.travis.yml` file:

```
language: minimal

services:
  - docker

before_install:
- docker pull fsfe/reuse:latest
- docker run -v ${TRAVIS_BUILD_DIR}:/data fsfe/reuse:latest lint
```

More information on Travis CI on [travis-ci.com](https://travis-ci.com).
