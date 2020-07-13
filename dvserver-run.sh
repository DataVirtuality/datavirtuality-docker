#!/usr/bin/env bash

docker_args=(-d --name dvserver -h dvserver --env-file config.env -p 8080:8080/tcp -p 31000:31000/tcp -p 31001:31001/tcp -p 35432:35432/tcp -p 35433:35433/tcp)

if [[ $# -eq 0 || $# -ge 3 ]]; then
    echo "Usage: dvserver-run.sh IMAGE:TAG [VOLUME_NAME]"
    echo ""
    echo "  IMAGE        the name of the image to run"
    echo "  TAG          the version tag of the image to run"
    echo "  VOLUME_NAME  the name of a Docker volume to attach to the container. The volume will get created if it does not exist yet."
    echo ""
    echo "Example: ./dvserver-run.sh dvserver:2.3.10 dv_persistent_data"

    exit 1
elif [[ $# -eq 1 ]]; then
    img_to_run=$1
elif [[ $# -eq 2 ]]; then
    img_to_run=$1
    volume_name=$2
    docker_args+=(-v "${volume_name}:/opt/datavirtuality/persistent_data")
fi

docker run "${docker_args[@]}" "$img_to_run"
