#!/usr/bin/env bash

set -eux

REPO_ROOT="$(git rev-parse --show-toplevel)"
BASE_DIR="$REPO_ROOT/base"

pushd $BASE_DIR

source definitions.sh

for debrel in ${DEBIAN_RELEASES[@]}; do
    THIS_IMAGE_TAG=$(get_base_image_tag "$debrel")
    echo "Pushing image $THIS_IMAGE_TAG..."
    docker push $THIS_IMAGE_TAG
    LATEST_IMAGE_TAG=$(get_base_image_tag_latest "$debrel")
    echo "Pushing image $THIS_IMAGE_TAG as $LATEST_IMAGE_TAG..."
    docker tag $THIS_IMAGE_TAG $LATEST_IMAGE_TAG
    docker push $LATEST_IMAGE_TAG
done

for derived_push in $(find derived -name "push.sh"); do
    ./$derived_push
done

popd

echo "Done!"
