---
# SPDX-FileCopyrightText: 2020 Free Software Foundation Europe e.V.
# SPDX-FileCopyrightText: © 2020 Liferay, Inc. <https://liferay.com>
# SPDX-License-Identifier: CC-BY-SA-4.0 AND CC0-1.0

title: "Help for developers"
---

Licensing should be easy for developers. We provide several tools and services to allow you to concentrate on coding.

Contents: [Helper tool](#tool), [example repositories](#repos), [REUSE API](#api), [CI/CD workflows](#ci)


## REUSE Tool {#tool}

The [REUSE tool](https://codeberg.org/fsfe/reuse-tool) assists with achieving and
confirming REUSE compliance. It downloads the full license texts, adds copyright
and license information to file headers, and contains a linter to identify
problems. Eventually, you can generate a software bill of materials.

Read the [documentation](https://reuse.readthedocs.io) to learn more about the
tool. You will also find a ['How do I ...' in our FAQ]({{< relref "faq.md#howto"
>}}) to learn about various tool interactions.

## Example repositories {#repos}

What does a REUSE-compliant project look like? The following repositories are basic, but each of them is REUSE-compliant. We make them available to demonstrate how REUSE works in practice.

- [reuse-tutorial-example](https://codeberg.org/fsfe/reuse-tutorial-example) - a
  REUSE-compliant repository that matches the example in [the tutorial]({{<
  relref "tutorial.md" >}}). Includes a non-compliant branch for testing.
- [reuse-tool](https://codeberg.org/fsfe/reuse-tool) - the helper tool itself is
  compliant, just like [all other REUSE
  repositories](https://git.fsfe.org/reuse/).

Consider registering your project with the [REUSE API](#api) to include a
dynamic compliance badge.

## API {#api}

The [REUSE API](https://api.reuse.software) helps you to continuously check and
display compliance with the REUSE guidelines. You can include a badge indicating
the live status in your README file, and parse the output using the generated
JSON file.

This is how the badge will look like for a REUSE compliant project. You can
click on the badge to see more information: [![REUSE
status](https://api.reuse.software/badge/git.fsfe.org/reuse/api)](https://api.reuse.software/info/git.fsfe.org/reuse/api)

The API is the perfect tool for everyone who wants to show that their repository
follows best practices in providing licensing and copyright information. It
allows third-party services to integrate the live REUSE status, and offers a
simple alternative for people who do not want to install the [REUSE tool](#tool)
for a first quick check.

As everything else in REUSE, the API is [publicly
available](https://git.fsfe.org/reuse/api) under Free Software licenses.

## Pre-commit hook {#pre-commit-hook}

You can automatically run `reuse lint` on every commit as a pre-commit hook for
Git. This uses [pre-commit](https://pre-commit.com/). Once you [have it
installed](https://pre-commit.com/#install), add this to the
`.pre-commit-config.yaml` in your repository:

```yaml
# SPDX-FileCopyrightText: 2020 Free Software Foundation Europe e.V.
# SPDX-License-Identifier: CC0-1.0
repos:
  - repo: https://codeberg.org/fsfe/reuse-tool
    rev: v6.2.0
    hooks:
      - id: reuse
```

Then run `pre-commit install`. Now, every time you commit, `reuse lint` is run
in the background, and will prevent your commit from going through if there was
an error.

## Inclusion in CI/CD workflows {#ci}

REUSE can be easily integrated into your existing CI/CD processes to continuously test your repository and its changes for REUSE compliance.

The FSFE offers a Docker image which can be used in numerous CI solutions. Find a few examples below:

### Drone/Woodpecker CI

Include the following snippet in your `.drone.yml` file or
`.woodpecker/reuse.yaml` file:

```yaml
# SPDX-FileCopyrightText: 2020 Free Software Foundation Europe e.V.
# SPDX-License-Identifier: CC0-1.0
steps:
  - name: reuse
    image: fsfe/reuse:latest
```

More information about Drone at [docs.drone.io](https://docs.drone.io), and more
information about Woodpecker CI at
[woodpecker-ci.org](https://woodpecker-ci.org).

### Forgejo Actions

Include the following snippet in your `.forgejo/workflows/reuse.yaml` file:

```yaml
# SPDX-FileCopyrightText: 2020 Free Software Foundation Europe e.V.
# SPDX-License-Identifier: CC0-1.0
name: REUSE compliance check
on: [push, pull_request]

jobs:
  test:
    runs-on: <a tag for your runner>
    container: fsfe/reuse:latest
    steps:
      - run: |
          apk add nodejs
      - uses: actions/checkout@v5
      - name: Verify REUSE compliance
        run: |
          reuse lint
```

If your runner is not capable of running Docker containers, consider the
following snippet:

```yaml
# SPDX-FileCopyrightText: 2020 Free Software Foundation Europe e.V.
# SPDX-License-Identifier: CC0-1.0
name: REUSE compliance check
on: [push, pull_request]

jobs:
  test:
    runs-on: <a tag for your runner>
    steps:
      - run: |
          apt-get update
          apt-get install pipx
      - uses: actions/checkout@v5
      - name: Verify REUSE compliance
        run: |
          pipx run reuse lint
```

More information about Forgejo Actions at
[forgejo.org](https://forgejo.org/docs/latest/user/actions/).

### GitHub Actions

GitHub users can integrate the REUSE action in their workflow. Include the
following file as `.github/workflows/reuse.yaml`:

```yaml
# SPDX-FileCopyrightText: 2020 Free Software Foundation Europe e.V.
# SPDX-License-Identifier: CC0-1.0
name: REUSE compliance check
on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v5
      - name: REUSE Compliance Check
        uses: fsfe/reuse-action@v6
```

Visit the [action's marketplace
page](https://github.com/marketplace/actions/reuse-compliance-check) for more
usage instructions.

More information about GitHub Actions at
[docs.github.com](https://docs.github.com/en/actions/).

### GitLab CI/CD

Include the following snippet in your `.gitlab-ci.yml` file:

```yaml
# SPDX-FileCopyrightText: 2020 Free Software Foundation Europe e.V.
# SPDX-License-Identifier: CC0-1.0
reuse:
  image:
    name: fsfe/reuse:latest
    entrypoint: [""]
  script:
    - reuse lint
```

More information about GitLab's CI at
[docs.gitlab.com](https://docs.gitlab.com/ci/).

### Travis CI

Include the following snippet in your `.travis.yml` file:

```yaml
# SPDX-FileCopyrightText: 2020 Free Software Foundation Europe e.V.
# SPDX-License-Identifier: CC0-1.0
language: minimal

services:
  - docker

before_install:
  - docker pull fsfe/reuse:latest
  - docker run -v ${TRAVIS_BUILD_DIR}:/data fsfe/reuse:latest lint
```

More information on Travis CI at [travis-ci.com](https://travis-ci.com).
