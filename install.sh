#!/usr/bin/env bash

if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit
fi

SOURCE=${BASH_SOURCE[0]}
while [ -L "$SOURCE" ]; do
  DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )
  SOURCE=$(readlink "$SOURCE")
  [[ $SOURCE != /* ]] && SOURCE=$DIR/$SOURCE
done
DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )

read -r -p "Proceed with the installation? [y/N]" -n 1

echo

if [[ "$REPLY" =~ ^[Yy]$ ]]; then
    mkdir -p /opt/epics/main
    echo "Created /opt/epics/main"

    cp -rf * /opt/epics/main/
    echo "Copied files to /opt/epics/main"

    ln -sf /opt/epics/main/epics.sh /usr/bin/epics
    echo "Created an extension-less symlink to epics in /usr/bin"

    echo "Installation successful !"
    echo "Call 'epics <guide_entry>' whenever you want..."
fi
