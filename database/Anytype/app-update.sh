#!/bin/bash
DOWNLOAD_PAGE_URL="https://download.anytype.io"

if [[ "$(command -v wget)" == "" ]]; then
    echo "Fatal Error! Make sure to install \"wget\" to use this script!"
    exit 1
fi

PAGE_DATA="$(wget -qO- "$DOWNLOAD_PAGE_URL")"

get_version () {
    VERSION=""
    if [[ $PAGE_DATA =~ https://anytype-release\.fra1\.cdn\.digitaloceanspaces\.com/Anytype-[0-9.]{6,}AppImage ]]; then
        VERSION=$(echo "${BASH_REMATCH[0]}" | awk -F'https://anytype-release.fra1.cdn.digitaloceanspaces.com/Anytype-|.AppImage' '{print $2}')
    fi
    echo "$VERSION"
}

get_url () {
    DOWNLOAD_URL=""
    if [[ $PAGE_DATA =~ https://anytype-release\.fra1\.cdn\.digitaloceanspaces\.com/Anytype-[0-9.]{6,}AppImage ]]; then
        DOWNLOAD_URL="${BASH_REMATCH[0]}"
    fi
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
