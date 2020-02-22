#!/usr/bin/env bash

set -eux

REPO_ROOT="$(git rev-parse --show-toplevel)"
BASE_DIR="$REPO_ROOT/base"
THIS_DIR="$BASE_DIR/derived/rust-latest"

source "$BASE_DIR/definitions.sh"

pushd $BASE_DIR

for debrel in ${DEBIAN_RELEASES[@]}; do
    BASE_IMAGE="$(get_base_image_tag "$debrel")"
    THIS_IMAGE="$BASE_IMAGE.rust"
    echo "Pushing image $THIS_IMAGE..."
    docker push $THIS_IMAGE_TAG
done

popd

echo "Done!"
