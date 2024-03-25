#!/bin/bash
REQUIRED_TOOLS=(wget)

for CLI_TOOL in "${REQUIRED_TOOLS[@]}"
do
    if [[ -z $(command -v "$CLI_TOOL") ]]; then
        echo "Fatal Error! Make sure to install '$CLI_TOOL' to use this script!"
        exit 1
    fi
done

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