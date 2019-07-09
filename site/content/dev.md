---
# SPDX-Copyright: Free Software Foundation Europe e.V.
# SPDX-License-Identifier: CC-BY-SA-4.0

title: "Help for developers"
---

{{< box-alert >}}The resources below already make use of [REUSE 3.0](https://github.com/fsfe/reuse-docs/tree/v3.0a1) which is in draft stage currently.{{< /box-alert >}}

## Example repositories

These repositories are basic, but each of them is REUSE compliant. We make them available to demonstrate how REUSE works in practice.

- [reuse-example](https://github.com/fsfe/reuse-example) - a REUSE compliant repository showing a few methods to add copyright and licensing information. Includes a non-compliant branch for testing.
- [reuse-tool](https://github.com/fsfe/reuse-tool) - the helper tool itself is compliant.

## Tools

- [reuse](https://github.com/fsfe/reuse-tool), a linter tool to validate whether a repository is REUSE compliant or not, and a compiler tool to generate a project's bill of materials.

## Include in CI processes

REUSE can be easily integrated in your existing CI/CD processes to continuously test your repository and its changes for REUSE compliance.</p>

The FSFE offers a Docker image which can be used in numerous CI solutions. In the following, you will find a few examples:</p>

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

### GitLab EE

Include the following snipped in your `.gitlab-ci.yml` file:

```
reuse:
  image: fsfe/reuse:latest
  script:
    - reuse lint
```

More information about GitLab's EE CI on [docs.gitlab.com/ee](https://docs.gitlab.com/ee/).

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
