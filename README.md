# Portable Linux App Manager (portappm)

A complex bash script for management of apps distributed in formats that aren't easy to integrate like AppImage or binaries in tar archives.

## Features

* Auto updates - The tool utilizes per-app update scripts used to fetch the latest version and download url of the software.
* Desktop shortcuts - .desktop files can be automatically created and easily configured on per-app basis.
* All in one place - All apps can be stored in a designated directory and not scattered around the filesystem.
* CLI - It is easy to automate tasks like updating the apps with simple-to-use command line interface.

## Usage

`./portappm -c <COMMAND> -a <APP> -d <APPS_DIRECTORY>`
```
  
  -a <APP>
    <APP> is a reference to a subdirectory located in <APPS_DIRECTORY>. It can be up to 2 levels deep (eg. "My App" or "Tools/My Tool".
  -d <APPS_DIRECTORY>
    <APPS_DIRECTORY> is a reference to a directory in the filesystem which holds subdirectories containing the files of individual apps.
    It isn't required and will default to `~/Apps` directory.
  -c <COMMAND>
    Possible values for <COMMAND>: "update", "create_shortcut", "run", "add"
    "update":
      Checks for latest version of the software obtained from `app-update.sh -v` and updates it,
      if there's a new version (i.e. version different from the one saved in `.version` file) using
      the url obtained from "app-update.sh -u".
      If -a <APP> is passed, do it for the specified app - <APP>, otherwise do it for all apps.
    "create_shortcut":
      Checks if .desktop file exists in `~/.local/share/applications/Portable` and creates it,
      if it doesn't, using values specified in `app.conf`.
      If -a <APP> is passed, do it for the specified app - <APP>, otherwise do it for all apps.
    "run"
      Requires -a <APP> passed. It runs the specified app - <APP>, using options provided in `app.conf` file.
    "add"
      required -a <APP> passed. It creates default files to fill out to add a brand new app.
```
