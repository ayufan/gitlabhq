## Canonical source

The source of GitLab Community Edition is [hosted on GitLab.com](https://gitlab.com/gitlab-org/gitlab-ce/) and there are mirrors to make [contributing](CONTRIBUTING.md) as easy as possible.

# ![logo](https://about.gitlab.com/images/logo.svg) GitLab

## Open source software to collaborate on code

To see how GitLab looks please see the [features page on our website](https://about.gitlab.com/features/).

- Manage Git repositories with fine grained access controls that keep your code secure
- Perform code reviews and enhance collaboration with merge requests
- Each project can also have an issue tracker and a wiki
- Used by more than 100,000 organizations, GitLab is the most popular solution to manage Git repositories on-premises
- Completely free and open source (MIT Expat license)
- Powered by [Ruby on Rails](https://github.com/rails/rails)

## Editions

There are two editions of GitLab.
*GitLab [Community Edition](https://about.gitlab.com/features/) (CE)* is available without any costs under an MIT license.

*GitLab Enterprise Edition (EE)* includes [extra features](https://about.gitlab.com/features/#compare) that are most useful for organizations with more than 100 users.
To use EE and get official support please [become a subscriber](https://about.gitlab.com/pricing/).

## Code status

- [![build status](https://ci.gitlab.org/projects/1/status.png?ref=master)](https://ci.gitlab.org/projects/1?ref=master) on ci.gitlab.org (master branch)

- [![Build Status](https://semaphoreapp.com/api/v1/projects/2f1a5809-418b-4cc2-a1f4-819607579fe7/243338/badge.png)](https://semaphoreapp.com/gitlabhq/gitlabhq)

- [![Code Climate](https://codeclimate.com/github/gitlabhq/gitlabhq.svg)](https://codeclimate.com/github/gitlabhq/gitlabhq)

- [![Coverage Status](https://coveralls.io/repos/gitlabhq/gitlabhq/badge.png?branch=master)](https://coveralls.io/r/gitlabhq/gitlabhq?branch=master)

## Website

On [about.gitlab.com](https://about.gitlab.com/) you can find more information about:

- [Subscriptions](https://about.gitlab.com/subscription/)
- [Consultancy](https://about.gitlab.com/consultancy/)
- [Community](https://about.gitlab.com/community/)
- [Hosted GitLab.com](https://about.gitlab.com/gitlab-com/) use GitLab as a free service
- [GitLab Enterprise Edition](https://about.gitlab.com/gitlab-ee/) with additional features aimed at larger organizations.
- [GitLab CI](https://about.gitlab.com/gitlab-ci/) a continuous integration (CI) server that is easy to integrate with GitLab.

## Requirements

GitLab requires the following software:

- Ubuntu/Debian/CentOS/RHEL
- Ruby (MRI) 2.0 or 2.1
- Git 1.7.10+
- Redis 2.0+
- MySQL or PostgreSQL

Please see the [requirements documentation](doc/install/requirements.md) for system requirements and more information about the supported operating systems.

## Installation

The recommended way to install GitLab is using the provided [Omnibus packages](https://about.gitlab.com/downloads/). Compared to an installation from source, this is faster and less error prone. Just select your operating system, download the respective package (Debian or RPM) and install it using the system's package manager.

There are various other options to install GitLab, please refer to the [installation page on the GitLab website](https://about.gitlab.com/installation/) for more information.

You can access a new installation with the login **`root`** and password **`5iveL!fe`**, after login you are required to set a unique password.

## Third-party applications

There are a lot of [third-party applications integrating with GitLab](https://about.gitlab.com/applications/). These include GUI Git clients, mobile applications and API wrappers for various languages.

## GitLab release cycle

Since 2011 a minor or major version of GitLab is released on the 22nd of every month. Patch and security releases are published when needed. New features are detailed on the [blog](https://about.gitlab.com/blog/) and in the [changelog](CHANGELOG). For more information about the release process see the [release documentation](https://gitlab.com/gitlab-org/gitlab-ce/tree/master/doc/release). Features that will likely be in the next releases can be found on the [feature request forum](http://feedback.gitlab.com/forums/176466-general) with the status [started](http://feedback.gitlab.com/forums/176466-general/status/796456) and [completed](http://feedback.gitlab.com/forums/176466-general/status/796457).

## Upgrading

For updating the Omnibus installation please see the [update documentation](https://gitlab.com/gitlab-org/omnibus-gitlab/blob/master/doc/update.md). For installations from source there is an [upgrader script](doc/update/upgrader.md) and there are [upgrade guides](doc/update) detailing all necessary commands to migrate to the next version.

## Install a development environment

To work on GitLab itself, we recommend setting up your development environment with [the GitLab Development Kit](https://gitlab.com/gitlab-org/gitlab-development-kit).
If you do not use the GitLab Development Kit you need to install and setup all the dependencies yourself, this is a lot of work and error prone.
One small thing you also have to do when installing it yourself is to copy the example development unicorn configuration file:

    cp config/unicorn.rb.example.development config/unicorn.rb

Instructions on how to start GitLab and how to run the tests can be found in the [development section of the GitLab Development Kit](https://gitlab.com/gitlab-org/gitlab-development-kit#development).

## Documentation

All documentation can be found on [doc.gitlab.com/ce/](http://doc.gitlab.com/ce/).

## Getting help

Please see [Getting help for GitLab](https://about.gitlab.com/getting-help/) on our website for the many options to get help.

## Is it any good?

[Yes](https://news.ycombinator.com/item?id=3067434)

## Is it awesome?

Thanks for [asking this question](https://twitter.com/supersloth/status/489462789384056832) Joshua.
[These people](https://twitter.com/gitlab/favorites) seem to like it.
