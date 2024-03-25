#!/bin/bash
DOWNLOAD_DATA_URL="https://api.github.com/repos/benjamimgois/goverlay/releases/latest"
REQUIRED_TOOLS=(wget jq)

for CLI_TOOL in "${REQUIRED_TOOLS[@]}"
do
    if [[ -z $(command -v "$CLI_TOOL") ]]; then
        echo "Fatal Error! Make sure to install '$CLI_TOOL' to use this script!"
        exit 1
    fi
done

# Get data from GitHub
RELEASE_DATA=$(wget -qO- $DOWNLOAD_DATA_URL)
if [[ -z "$RELEASE_DATA" ]]; 
then 
    echo "Fatal Error! Failed to get data from GitHub API. Endpoint: '$DOWNLOAD_DATA_URL'"
    exit 1
fi

get_version () {
    echo "$RELEASE_DATA" | jq -r ".tag_name"
}

get_url () {
    INDEX_COUNTER=-1
    for ASSET_NAME in $(echo "$RELEASE_DATA" | jq -r '.assets[].name');
    do
        INDEX_COUNTER=$(("$INDEX_COUNTER" + 1))
        if [[ $ASSET_NAME =~ goverlay.*\.tar\.xz ]];
        then
            echo "$RELEASE_DATA" | jq -r ".assets[$INDEX_COUNTER].browser_download_url"
            exit
        fi
    done
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