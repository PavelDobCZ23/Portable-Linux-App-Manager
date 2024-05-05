#!/bin/bash
DOWNLOAD_URL="https://discord.com/api/download/stable?platform=linux&format=tar.gz"
REQUIRED_TOOLS=(wget)

send_err () { echo "Fatal Error! $1" && exit 1; }

for CLI_TOOL in "${REQUIRED_TOOLS[@]}"; do
	if [[ -z $(command -v "$CLI_TOOL") ]]; then send_err "Make sure to install '$CLI_TOOL' to use this script!"; fi
done

get_version () {
	wget -S "$DOWNLOAD_URL" -o- -O /dev/null --max-redirect=0 | awk -F'linux/|/discord' 'BEGIN {IGNORECASE = 1} /Location: / {print $2}'
}

get_url () {
	if [[ -z "$1" ]]; then 
		echo "$DOWNLOAD_URL"
	else 
		echo "https://dl.discordapp.net/apps/linux/$1/discord-$1.tar.gz"
	fi
}

while getopts "u:v" OPT; do
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
