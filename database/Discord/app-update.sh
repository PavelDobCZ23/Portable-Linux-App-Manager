#!/bin/bash
DOWNLOAD_URL="https://discord.com/api/download/stable?platform=linux&format=tar.gz"

if [[ "$(command -v wget)" == "" ]]; then
    echo "Fatal Error! Make sure to install \"wget\" to use this script!"
    exit 1
fi

get_version () {
    VERSION=$(wget -S --max-redirect=0 "$DOWNLOAD_URL" 2>&1 | awk -F'linux/|/discord' '/Location: / {print $2}')
    echo "$VERSION"
}

get_url () {
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
