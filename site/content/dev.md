---
title: "REUSE For developers"
---
<div class="intro-header">

<div class="container header-container">
    <div class="row">
       <div class="col-md-1"></div>
       <div class="intro-image col-md-3">
          <img src="/img/reuse.png" style="width: 60%; margin-top: 4em;" />
<center> <div style="width: 100%;margin-top: 3em;"><p>
             </p>
           </div></center>
       </div>

<div class="intro-message col-md-6">
      <h3>Example repositories</h3>
      <p>These repositories are basic, but each of them is REUSE compliant.
      We make them available to demonstrate how REUSE works in practice.</p>
      <ul>
       <li><a href="https://github.com/fsfe/reuse-example">reuse-example</a> - a REUSE compliant repository showing a few methods to add copyright and licensing information. Includes a non-compliant branch for testing.</li>
       <li><a href="https://github.com/fsfe/reuse-tool">reuse-tool</a> - the helper tool itself is compliant.</li>
      </ul>

      <h3>Tools</h3>
      <ul>
       <li><a href="https://github.com/fsfe/reuse-tool">reuse</a>, a linter tool to validate whether a repository is REUSE compliant or not, and a compiler tool to generate a project's bill of materials.</li>
      </ul>

      <h3>Include in CI processes</h3>

      <p>REUSE can be easily integrated in your existing CI/CD processes to continuously test your repository and its changes for REUSE compliance.</p>

      <p>The FSFE offers a Docker image which can be used in numerous CI solutions. In the following, you will find a few examples:</p>

      <h4>Drone</h4>

      <p>Include the following snipped in your `.drone.yml` file:</p>

<pre>
pipeline:
  reuse:
    image: fsfe/reuse:latest
    commands:
      - reuse lint
</pre>

      <p>More information about Drone on <a href="https://drone.io">drone.io</a>.</p>

      <h4>GitLab EE</h4>

      <p>Include the following snipped in your `.gitlab-ci.yml` file:</p>

<pre>
reuse:
  image: fsfe/reuse:latest
  script:
    - reuse lint
</pre>

      <p>More information about GitLab's EE CI on <a href="https://docs.gitlab.com/ee/">docs.gitlab.com/ee</a>.</p>

      <h4>Travis CI</h4>

      <p>Include the following snipped in your `.travis.yml` file:</p>

<pre>
language: minimal

services:
  - docker

before_install:
- docker pull fsfe/reuse:latest
- docker run --name reuse -v ${TRAVIS_BUILD_DIR}:/repo fsfe/reuse /bin/sh -c "cd /repo; reuse lint"
</pre>

      <p>More information on Travis CI on <a href="https://travis-ci.com">travis-ci.com</a>.</p>

      <!--<h3>Documentation</h3>
      <p>
       Aside from the <a href="/practices/">practices</a>, we have some
       blog posts and similar documents which might be useful for you to
       understand how the REUSE practices work.. in practice.
      </p>
      <ul>
       <li><a href="http://blog.jonasoberg.net/a-reuse-compliant-curl/">REUSE curl</a>, a guide in making a mid sized project like curl REUSE compliant.</li>
       <li><a href="http://blog.jonasoberg.net/reuse-templates/">REUSE templates</a>, some information about our REUSE example repositories.</li>-->
      </ul>
    </div>
</div>
</div>
