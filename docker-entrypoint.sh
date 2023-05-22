#!/bin/bash
set -e
if [[ -n $FORCE_UPDATE ]] && [[ $FORCE_UPDATE == "true" ]];then
    steamcmd +force_install_dir "/opt/pzserver" +login anonymous +app_update 380870 validate +quit
fi

if [ $# -eq 0 ];then
    /opt/pzserver/start-server.sh -cachedir=/data -servername "$SERVER_NAME"
else
    exec "$@"
fi