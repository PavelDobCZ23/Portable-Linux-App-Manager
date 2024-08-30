#!/bin/bash

#GET VERSION:
# DOWNLOAD WEBSITE | FILTER LINKS | FILTER ".appimage" | ISOLATE VERSION FROM LINK
KRITA_VERSION=$(wget "https://krita.org/en/download/" --max-redirect=0 -o /dev/null -O- | grep -o -i -e "https://[^ ]* " | grep ".appimage" -i -m 1 | awk -F'krita-|-x86_64' '{print $2}')
DOWNLOAD_URL="https://download.kde.org/stable/krita/$KRITA_VERSION/krita-$KRITA_VERSION-x86_64.appimage"
TEMP_DIR=$(mktemp)
wget "$DOWNLOAD_URL" -O "$TEMP_DIR/krita.appimage"
"$TEMP_DIR/krita.appimage" --appimage-extract
