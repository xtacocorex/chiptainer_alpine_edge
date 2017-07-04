# BASE OFF THE 3.5 ALPINE CHIPTAINER
FROM nextthingco/chiptainer_alpine

# SWITCH ALPINE FROM V3.5 TO EDGE
RUN sed -i -e 's/v3\.5/edge/g' /etc/apk/repositories && \
    sed -i -e '$i http://dl-cdn.alpinelinux.org/alpine/edge/testing\n' /etc/apk/repositories && \
    # UPDATE ALPINE
    apk upgrade --update-cache --available

# THE ENTRY POINT
ENTRYPOINT /bin/sh
