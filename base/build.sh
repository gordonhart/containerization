#!/usr/bin/env bash

set -eux

#
# TODO: there is currently a lot of copypasta between build/push scripts and
# the derived build/push scripts -- refactor
#

REPO_ROOT="$(git rev-parse --show-toplevel)"
BASE_DIR="$REPO_ROOT/base"

pushd $BASE_DIR

source definitions.sh

for debrel in ${DEBIAN_RELEASES[@]}; do
    THIS_IMAGE_TAG=$(get_base_image_tag "$debrel")
    echo "Building image $THIS_IMAGE_TAG..."
    docker build \
        --tag "$THIS_IMAGE_TAG" \
        --build-arg DEBIAN_RELEASE="$debrel" \
        --build-arg USER_NAME="$USER_NAME" \
        .
done

for derived_build in $(find derived -name "build.sh"); do
    ./$derived_build
done

popd

echo "Done!"
