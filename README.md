# Valhalla container for Valheim

This repository contains the definition for my `toneoyay/valhalla` docker image.

You can run this docker image to easily run a Valheim dedicated server without having to mess around with steamcmd on the command line. All the required steps are neatly encapsulated in this image.

The image itself **DOES NOT** actually contain Valheim. Instead, the image downloads Valheim on first run, and updates when restarted.

## Running

1. First, make sure you have Docker Desktop installed on your machine (Linux users you can figure this one out yourselves, right?)

1. Copy `docker-compose.yml` and `saves/` to a location on your desktop/laptop/server of choice. Your world will be saved in the same directory as the `yml` file.

1. _(optional)_ Configure the server - see the configuration section below.

1. Next, open a command prompt/terminal and type '`docker compose up&`' (include the `&`). This will launch the server and detach it from the terminal so you can close it without killing the server.

1. Give it time to download the server files from Steam.

## Configuration

This is defined with environment variables in the `docker-compose.yml` file. This requires a restart of the server to take effect. Defaults are:

```ini
VALHEIM_WORLD_NAME=Valheim World
VALHEIM_NAME=Til Valhalla
VALHEIM_PASSWORD=password
VALHEIM_PORT=2456
```

You can uncomment out the `restart: always` line if you want the server to start automatically with Docker.

Example docker-compose file:

```yml
version: '3.8'

services:
    valheim-server:
        image: toneoyay/valhalla:latest
        ports:
            - '2456:2456/udp'
            - '2456:2456/tcp'
            - '2457:2457/udp'
        volumes:
            - ./saves/:/home/steam/valheim-dserver/save/
        environment:
            - VALHEIM_NAME=Til Valhalla
            - VALHEIM_PASSWORD=password
        #restart: always
```

Port 2457 is the steam query port and (as far as I know) can't be changed. However, you should be able to change 2456.

# Technicals

## Volumes

By default the container stores the save files in a volume mounted to the `./save/` directory. You can change this in the `docker-compose.yml` file.

The container should try to chmod it itself. If you get write errors, please ensure the docker user has access to the folder you have chosen.

The server files are downloaded at runtime and stored within a docker volume that is, by default, not exposed. This means this docker package is relatively small, only needs to download the server once, and is able to automatically update itself when needed.
