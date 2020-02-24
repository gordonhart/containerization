#!/usr/bin/env bash

set -eux

USER_NAME="gordonhart"
REPO_NAME="base"
BASE_IMAGE_NAME="$USER_NAME/$REPO_NAME"
BASE_IMAGE_VERSION="$(git describe --tags --always --dirty)"

DEBIAN_RELEASES=(
    stretch
    buster
)

get_base_image_tag() {
    if [ -z "$1" ]; then
        echo "usage: get_base_image_tag <debian_release>"
        return 1
    fi
    echo "$BASE_IMAGE_NAME:$BASE_IMAGE_VERSION.$1"
}

get_base_image_tag_latest() {
    if [ -z "$1" ]; then
        echo "usage: get_base_image_tag_latest <debian_release>"
        return 1
    fi
    echo "$BASE_IMAGE_NAME:latest.$1"
}
