#!/bin/bash
DOWNLOAD_PAGE_URL="https://download.anytype.io"
REQUIRED_TOOLS=(wget)

send_err () { echo "Fatal Error! $1" && exit 1; }

for CLI_TOOL in "${REQUIRED_TOOLS[@]}"; do
  if [[ -z $(command -v "$CLI_TOOL") ]]; then send_err "Make sure to install '$CLI_TOOL' to use this script!"; fi
done

PAGE_DATA=$(wget -qO- "$DOWNLOAD_PAGE_URL")

get_version () {
  if [[ $PAGE_DATA =~ https://anytype-release\.fra1\.cdn\.digitaloceanspaces\.com/Anytype-[0-9.]{6,}AppImage ]]; then
    echo "${BASH_REMATCH[0]}" | awk -F'https://anytype-release.fra1.cdn.digitaloceanspaces.com/Anytype-|.AppImage' '{print $2}'
  fi
}

get_url () {
  if [[ $PAGE_DATA =~ https://anytype-release\.fra1\.cdn\.digitaloceanspaces\.com/Anytype-[0-9.]{6,}AppImage ]]; then
    echo "${BASH_REMATCH[0]}"
  fi
}

while getopts "uv" OPT; do
  case "${OPT}" in
    v)
      get_version
      ;;
    u)
      get_url "${OPTARG}"
      ;;
    *)
  esac
done
