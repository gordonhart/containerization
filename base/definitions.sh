#!/usr/bin/env bash

set -eux

BASE_IMAGE_NAME="gordonhart/base"
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
    echo "$BASE_IMAGE_NAME:$BASE_IMAGE_VERSION.$1.base"
}
