#!/usr/bin/env bash

set -e

function cleanup {
  rm -rf dvserver
}

trap cleanup EXIT

if [[ $# -eq 0 || $# -ge 4 ]]; then
    echo "Usage: dvserver-build.sh IMAGE TAG [DVSERVER_PACKAGE]"
    echo ""
    echo "  IMAGE            the name of the image to build"
    echo "  TAG              the version tag of the image to build"
    echo "  DVSERVER_PACKAGE the local path to a dvserver Linux ZIP package. The default value is dvserver-TRUNK.linux.x86_64.zip."
    echo ""
    echo "Example: ./dvserver-build.sh dvserver 2.3.10 dvserver-RELEASE_2.3.10.linux.x86_64.zip"

    exit 1
elif [[ $# -eq 2 ]]; then
    img_to_build=$1
    tag_to_build=$2
    arg_dvserver_ver_to_deploy=dvserver-TRUNK.linux.x86_64.zip
elif [[ $# -eq 3 ]]; then
    img_to_build=$1
    tag_to_build=$2
    arg_dvserver_ver_to_deploy=$3
fi

unzip "$arg_dvserver_ver_to_deploy"
docker build -t "${img_to_build}:${tag_to_build}" .
