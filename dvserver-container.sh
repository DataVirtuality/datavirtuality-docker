#!/bin/bash -e

# if a bind mount is used instead of a volume, existing files will be missing. Fix it by copying them again.
if [[ ! -f "/opt/datavirtuality/persistent_data/dvserver-standalone.xml" ]]; then
    echo "bind mount detected, restoring files..."

    mkdir -p /opt/datavirtuality/persistent_data/log
    cp /opt/datavirtuality/original_files/license.lic /opt/datavirtuality/persistent_data/license.lic
    cp /opt/datavirtuality/original_files/dvserver-standalone.xml /opt/datavirtuality/persistent_data/dvserver-standalone.xml
fi

/opt/datavirtuality/dvserver/bin/dvserver.sh
