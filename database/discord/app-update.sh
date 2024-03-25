#!/bin/bash
DOWNLOAD_URL="https://discord.com/api/download/stable?platform=linux&format=tar.gz"
REQUIRED_TOOLS=(wget)

for CLI_TOOL in "${REQUIRED_TOOLS[@]}"
do
    if [[ -z $(command -v "$CLI_TOOL") ]]; then
        echo "Fatal Error! Make sure to install '$CLI_TOOL' to use this script!"
        exit 1
    fi
done

get_version () {
    wget -S --max-redirect=0 "$DOWNLOAD_URL" 2>&1 | awk -F'linux/|/discord' '/Location: / {print $2}'
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
