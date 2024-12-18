#!/bin/bash
set -e
if [[ -n $FORCE_UPDATE ]] && [[ $FORCE_UPDATE == "true" ]]; then
    /home/steam/steamcmd/steamcmd.sh +force_install_dir "/opt/pzserver" +login anonymous +app_update 380870 validate +quit
fi

if [ $# -eq 0 ]; then
    /opt/pzserver/start-server.sh -cachedir=/data -servername "$SERVER_NAME" -adminusername "$ADMIN_USERNAME" -adminpassword "$ADMIN_PASSWORD"
else
    exec "$@"
fi
