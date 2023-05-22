FROM steamcmd/steamcmd:latest

ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /opt/pzserver

RUN steamcmd +force_install_dir "/opt/pzserver" +login anonymous +app_update 380870 validate +quit

ENV SERVER_NAME=servertest
ENV FORCE_UPDATE=false

ADD docker-entrypoint.sh /docker-entrypoint.sh

EXPOSE 16261/udp 16262/udp

VOLUME [ "/data" ]

ENTRYPOINT [ "/docker-entrypoint.sh" ]
