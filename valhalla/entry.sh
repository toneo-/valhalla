#!/bin/bash

echo "Updating server..."

bash "/home/steam/steamcmd/steamcmd.sh" +login anonymous +force_install_dir "$VALHEIM_INSTALL_DIR" +app_update 896660 validate +quit

echo "Running server..."

./valheim_server.x86_64 \
    -nographics \
    -batchmode \
    -name "$VALHEIM_NAME" \
    -password "$VALHEIM_PASSWORD" \
    -port $VALHEIM_PORT \
    -world "$VALHEIM_WORLD_NAME" \
    -savedir "$VALHEIM_SAVE_DIRECTORY"