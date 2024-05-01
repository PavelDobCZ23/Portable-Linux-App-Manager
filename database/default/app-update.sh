#!/bin/bash

REQUIRED_TOOLS=() # Here you may list all the CLI tools required by the script.

send_err () { echo "Fatal Error! $1" && exit 1; } # This function is used to send an error.

for CLI_TOOL in "${REQUIRED_TOOLS[@]}"; do
  if [[ -z $(command -v "$CLI_TOOL") ]]; then send_err "Make sure to install '$CLI_TOOL' to use this script!"; fi
done

# This is the function that returns the latest version of the app to check when updating.
get_version () {
  echo ""
}

# This is the function that returns a URL leading to a downloadable file.
# It may accept a single argument specifying which version to download.
get_url () {
  SET_VERSION="$1"
  echo ""
}

while getopts "uv" OPT; do
  case "${OPT}" in
    v)
      get_version && exit 0
      ;;
    u)
      get_url "${OPTARG}" && exit 0
      ;;
    *)
  esac
done