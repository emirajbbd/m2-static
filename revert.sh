#!/usr/bin/env bash

set -euo pipefail

VENDOR="Magento"
THEME="luma"
BUILD_FILE="build.json"
BASE_DIR="$PWD"
PERF_OPTIMIZE=${OPTIMIZE:-none}

bundle () {
    RELEASE_DIRECTORY="pub/static/frontend/$VENDOR/$THEME/$1_src"
    DEST_DIRECTORY="pub/static/frontend/$VENDOR/$THEME/$1"

    if [ ! -d "$DEST_DIRECTORY" ]; then
        echo "this locale does not exist"
        exit 1
    fi

    if [ -d "$RELEASE_DIRECTORY" ]; then
        echo "reverting previous build"
        rm -rf ${DEST_DIRECTORY}
        mv ${RELEASE_DIRECTORY} ${DEST_DIRECTORY}
    fi
}

for var in "$@"
do
    echo "Bundling $var"
    bundle $var
done
