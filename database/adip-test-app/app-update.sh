#!/bin/bash

REQUIRED_TOOLS=() # Here you may list all the CLI tools required by the script.

send_err () { echo "Fatal Error! $1" && exit 1; } # This function is used to send an error.

for CLI_TOOL in "${REQUIRED_TOOLS[@]}"; do
  if [[ -z $(command -v "$CLI_TOOL") ]]; then send_err "Make sure to install '$CLI_TOOL' to use this script!"; fi
done

# This is the function that returns the latest version of the app to check when updating.
get_version () {
  echo "1.0"
}

# This is the function that returns a URL leading to a downloadable file.
# It accepts a single argument specifying which version to download, empty gets the latest.
get_url () {
  SET_VERSION="$1"
  echo "https://github.com/benjamimgois/goverlay/releases/download/1.2/goverlay.tar.xz"
}

# This defines arguments -u and -v. Argument -u must be given some string!
while getopts "u:v" OPT; do
  case "${OPT}" in
    u)
      get_url "${OPTARG}"
      ;;
    v)
      get_version
      ;;
    *)
  esac
done