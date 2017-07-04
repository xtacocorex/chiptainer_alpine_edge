#!/bin/sh

CONTAINER_IMAGE=${CONTAINER_IMAGE:-chiptainer_alpine_edge}

case "$1" in
    build)
        docker build --no-cache=true -t "${CONTAINER_IMAGE}" .
        ;;
    tag)
        docker tag chiptainer_alpine_edge xtacocorex/chiptainer_alpine_edge
        ;;
    push)
        docker push xtacocorex/chiptainer_alpine_edge
        ;;
    all)
        echo "BUILDING"
        docker build --no-cache=true -t "${CONTAINER_IMAGE}" .
        echo "TAGGING"
        docker tag chiptainer_alpine_edge xtacocorex/chiptainer_alpine_edge
        echo "PUSHING"
        docker push xtacocorex/chiptainer_alpine_edge
        ;;
    remove-tags)
        docker rmi `docker images | grep chiptainer_alpine_edge | grep "<none>" | tr -s " " | cut -d " " -f 3`
        ;;
esac
