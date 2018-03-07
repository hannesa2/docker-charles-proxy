#!/bin/bash

CMD="docker run \
       --rm \
       --name charles \
       --net "host" \
       --env DISPLAY=unix$DISPLAY \
       --volume /tmp/.X11-unix:/tmp/.X11-unix \
       kurron/docker-charles-proxy:3.11.5"

echo $CMD
$CMD
