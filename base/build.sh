#!/usr/bin/env bash

set -eux

BASE_IMAGE_NAME="gordonhart/base"
BASE_IMAGE_VERSION="$(git describe --tags --always --dirty)"

for debrel in "stretch" "buster"; do # "bullseye"
    THIS_IMAGE="$BASE_IMAGE_NAME:$BASE_IMAGE_VERSION.$debrel.base"
    echo "Building image $THIS_IMAGE..."
    docker build \
        --tag "$THIS_IMAGE" \
        --build-arg DEBIAN_RELEASE="$debrel" \
        .
done

echo "Done!"
