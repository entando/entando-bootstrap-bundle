#!/bin/bash

. .ent/enp-prereq.sh

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
_log_i "Running build"

docker build -t "$ENTANDO_OPT_DOCKER_ORG/$ENTANDO_PRJ_NAME:$ENTANDO_PRJ_VERSION" .
