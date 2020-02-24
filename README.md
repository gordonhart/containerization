# Containerization Utilities
[![Build Status](https://travis-ci.org/gordonhart/containerization.svg?branch=master)](https://travis-ci.org/gordonhart/containerization)
[![Docker Pulls](https://img.shields.io/docker/pulls/gordonhart/base?style=plastic)](https://hub.docker.com/r/gordonhart/base)

- `base`: interactive-ready base images derived from different Debian releases.
  Large and clunky for production use but comfortable for hacking and
  exploration.
    - e.g. `gordonhart/base:v0.1.0.buster`
- `rust`: the above with the latest toolchain from [rustup](https://rustup.rs/)
    - e.g. `gordonhart/base:v0.1.0.buster.rust`

## Usage

The default image name is `gordonhart/base` and will include a user `gordonhart`
with UID/GID 1000 and home `/home/gordonhart`. The user name and image name can
be changed by modifying `base/definitions.sh`.

```bash
# initialize:
$ make submodules

# build base images:
# NOTE: derives the tag based on latest git tag, e.g. v0.1.0-1-g05661be
$ make build

# push to Dockerhub (will need my credentials):
$ make push

# all of the above:
$ make all
```
