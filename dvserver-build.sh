#!/usr/bin/env bash

set -e

if [[ $# -eq 0 || $# -ge 3 ]]; then
    echo "Useage: dvserver-build.sh <img_to_build:tag> <arg_dvserver_ver_to_deploy>"
    echo "        Parameter <image:tag> is mandatory."
    echo "Example: ./dvserver-build.sh dvserver:2.3.10 dvserver-TRUNK.linux.x86_64.zip"
    exit 1
elif [[ $# -eq 1 ]]; then
    img_to_build=$1
    arg_dvserver_ver_to_deploy=dvserver-TRUNK.linux.x86_64.zip
elif [[ $# -eq 2 ]]; then
    img_to_build=$1
    arg_dvserver_ver_to_deploy=$2
fi

unzip "$arg_dvserver_ver_to_deploy"
docker build -t "$img_to_build" .
rm -rf dvserver
