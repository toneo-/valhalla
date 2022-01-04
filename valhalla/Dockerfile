FROM cm2network/steamcmd:root

ENV VALHEIM_INSTALL_DIR /home/steam/valheim-dserver/
ENV VALHEIM_SAVE_DIRECTORY /home/steam/valheim-dserver/save/
ENV VALHEIM_WORLD_NAME Valheim World

ENV VALHEIM_NAME Til Valhalla
ENV VALHEIM_PASSWORD password
ENV VALHEIM_PORT 2456

WORKDIR $VALHEIM_INSTALL_DIR
COPY ./entry.sh ./entry.sh

RUN set -x \ 
    && mkdir --parents "$VALHEIM_INSTALL_DIR" "$VALHEIM_SAVE_DIRECTORY" \
    && chown -R "steam:steam" "$VALHEIM_INSTALL_DIR" "$VALHEIM_SAVE_DIRECTORY" \
    && chmod +x ./entry.sh

VOLUME $VALHEIM_INSTALL_DIR

USER steam
CMD ["bash", "entry.sh"]