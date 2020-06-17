#!/usr/bin/env bash

img_to_run=$1

if [[ $# -eq 0 ]]; then
    echo "    Use: dvserver-build.sh <img_to_run:tag>"
    echo "    Use: dvserver-build.sh dvserver:0.0.9"

else
    docker build -t $img_to_run .
fi

