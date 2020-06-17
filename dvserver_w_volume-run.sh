#!/usr/bin/env bash

if [[ $# -eq 0 ]]; then
    echo "    Use: dvserver_w_volume-run.sh <volume name> <local path for mount inside conrainer> <image:tag>"
    echo "    Use: dvserver_w_volume-run.sh dv-static-volume /opt/datavirtuality/external/ dvserver:0.0.8"

else
    volumename=$1
    local_path_mount=$2
    img_to_run=$3
    docker volume create $volumename
    docker run -itd --name dvserver -h dvserver -v $volumename:$local_path_mount$volumename -p 8080:8080/tcp -p 31000:31000/tcp -p 31001:31001/tcp -p 35432:35432/tcp -p 35433:35433/tcp $img_to_run /bin/bash
fi


