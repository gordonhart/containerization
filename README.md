# Containerization Utilities

- `base`: interactive-ready base images derived from difffferent Debian
  releases. Large and clunky for production use but comfortable for hacking and
  exploration.

## Usage

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
