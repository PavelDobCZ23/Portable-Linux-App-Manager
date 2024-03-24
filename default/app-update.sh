#!/bin/bash

if [[ "$(command -v wget)" == "" ]]; then
    echo "Fatal Error! Make sure to install 'wget' to use this script!"
    exit 1
fi

get_version () {
    VERSION=""
    echo "$VERSION"
}

get_url () {
    DOWNLOAD_URL=""
    echo "$DOWNLOAD_URL"
}

while getopts "uv" OPT; do
    case "${OPT}" in
        v)
            get_version
            ;;
        u)
            get_url
            ;;
        *)
    esac
done