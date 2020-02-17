#!/usr/bin/env bash

set -eux

source definitions.sh

for debrel in ${DEBIAN_RELEASES[@]}; do
    THIS_IMAGE_TAG=$(get_base_image_tag "$debrel")
    echo "Building image $THIS_IMAGE_TAG..."
    docker build \
        --tag "$THIS_IMAGE_TAG" \
        --build-arg DEBIAN_RELEASE="$debrel" \
        .
done

echo "Done!"
