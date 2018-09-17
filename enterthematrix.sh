#!/bin/sh
docker run --rm -h "ge0docker" \
    -ti --entrypoint /usr/sbin/zsh --name ge0 ge0docker
