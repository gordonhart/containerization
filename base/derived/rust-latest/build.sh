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
    echo "Building image $THIS_IMAGE..."
    docker build \
        --tag "$THIS_IMAGE" \
        --build-arg BASE_IMAGE="$BASE_IMAGE" \
        --file "$THIS_DIR/Dockerfile" \
        .
done

popd

echo "Done!"
