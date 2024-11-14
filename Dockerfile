FROM cm2network/steamcmd:root

ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /opt/pzserver

RUN /home/steam/steamcmd/steamcmd.sh \
    +force_install_dir "/opt/pzserver" \
    +login anonymous \
    +app_update 380870 validate \
    +quit

ENV SERVER_NAME=servertest
ENV FORCE_UPDATE=false
ENV ADMIN_USERNAME=admin
ENV ADMIN_PASSWORD=changeme

COPY docker-entrypoint.sh /docker-entrypoint.sh

EXPOSE 16261/udp 16262/udp

VOLUME [ "/data" ]

ENTRYPOINT [ "/docker-entrypoint.sh" ]
