#!/usr/bin/env bash

set -eux

source definitions.sh

for debrel in ${DEBIAN_RELEASES[@]}; do
    THIS_IMAGE_TAG=$(get_base_image_tag "$debrel")
    echo "Pushing image $THIS_IMAGE_TAG..."
    docker push $THIS_IMAGE_TAG
done

echo "Done!"
