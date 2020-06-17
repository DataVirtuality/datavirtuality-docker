#!/usr/bin/env bash

volumename=$1
local_path_mount=$2

cd /opt/datavirtuality/dvserver

if [[ $# -eq 0 ]]; then
    echo "    Use: dvserver_move_to_ext_volume.sh <volume name> <local path mounted inside conrainer>"
    echo "    Use: dvserver_move_to_ext_volume.sh dv-static-volume /opt/datavirtuality/external/"
    ./dvserver.sh start
else
    mv pgsql $local_path_mount$volumename/
    mv standalone $local_path_mount$volumename/
    ln -s $local_path_mount$volumename/pgsql pgsql
    ln -s $local_path_mount$volumename/standalone standalone
    ./bin/dvserver.sh start
fi