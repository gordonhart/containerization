#!/usr/bin/env bash

set -eux

REPO_ROOT="$(git rev-parse --show-toplevel)"
BASE_DIR="$REPO_ROOT/base"
THIS_DIR="$BASE_DIR/derived/rust-latest"

source "$BASE_DIR/definitions.sh"

pushd $BASE_DIR

for debrel in ${DEBIAN_RELEASES[@]}; do
    BASE_IMAGE_TAG="$(get_base_image_tag "$debrel")"
    THIS_IMAGE_TAG="$BASE_IMAGE_TAG.rust"
    echo "Pushing image $THIS_IMAGE_TAG..."
    docker push $THIS_IMAGE_TAG
    LATEST_IMAGE_TAG=$(get_base_image_tag_latest "$debrel")
    echo "Pushing image $THIS_IMAGE_TAG as $LATEST_IMAGE_TAG..."
    docker tag $THIS_IMAGE_TAG $LATEST_IMAGE_TAG
    docker push $LATEST_IMAGE_TAG
done

popd

echo "Done!"
