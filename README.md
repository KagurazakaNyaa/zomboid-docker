# zomboid-docker

[![Check Update](https://github.com/KagurazakaNyaa/zomboid-docker/actions/workflows/update.yml/badge.svg)](https://github.com/KagurazakaNyaa/zomboid-docker/actions/workflows/update.yml)
[![Build Docker Image](https://github.com/KagurazakaNyaa/zomboid-docker/actions/workflows/docker.yml/badge.svg)](https://github.com/KagurazakaNyaa/zomboid-docker/actions/workflows/docker.yml)

![Docker Pulls](https://img.shields.io/docker/pulls/kagurazakanyaa/zomboid)
![Docker Stars](https://img.shields.io/docker/stars/kagurazakanyaa/zomboid)
![Image Size](https://img.shields.io/docker/image-size/kagurazakanyaa/zomboid/latest)

Zomboid dedicated server with docker

## Environments

| Variable       | Describe                                                                           | Default Values | Allowed Values |
|----------------|------------------------------------------------------------------------------------|----------------|----------------|
| SERVER_NAME    | Specifies the name of the game instance displayed in the server list, string type. | test           | string         |
| ADMIN_USERNAME | Game instance administrator username, string type.                                 | admin          | string         |
| ADMIN_PASSWORD | Game instance administrator password, string type.                                 | changeme       | string         |
| FORCE_UPDATE   | Whether the server should be update each time start.                               | false          | true/false     |

## Volumes

| Path    | Describe               |
|---------|------------------------|
| `/data` | Game config and saves. |

NOTE: If you use bind instead of volume to mount, you need to manually change the volume owner to uid=1000.
In the case of the docker-compose.yml of the example, you need to execute `chown -R 1000:1000 ./data`
Please make sure the permissions and owners of the pak file you placed in the mods directory are correct.
