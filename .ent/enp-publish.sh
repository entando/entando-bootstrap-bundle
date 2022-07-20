#!/bin/bash

. .ent/enp-prereq.sh

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
_log_i "Running publication"

docker login registry.hub.docker.com \
  --username "$ENTANDO_OPT_DOCKER_USERNAME" \
  --password-stdin <<< "$ENTANDO_OPT_DOCKER_PASSWORD"

docker push "$ENTANDO_OPT_DOCKER_ORG/$ENTANDO_PRJ_NAME:$ENTANDO_PRJ_VERSION"
