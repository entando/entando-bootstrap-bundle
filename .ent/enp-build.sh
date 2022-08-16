#!/bin/bash

. .ent/enp-prereq.sh

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
_log_i "Running build"

mkdir -p ./tmp
cd ./tmp

ENTANDO_CRANE_VERSION=v0.10.0
curl -sL "https://github.com/google/go-containerregistry/releases/download/$ENTANDO_CRANE_VERSION/go-containerregistry_Linux_i386.tar.gz" \
   | tar -zxv

./crane export "$ENTANDO_PRJ_SRC_BUNDLE_URL" | tar x descriptor.yaml
sed -i "s/$ENTANDO_PRJ_SRC_BUNDLE_NAME/$ENTANDO_PRJ_NAME/" descriptor.yaml

{
  echo "FROM $ENTANDO_PRJ_SRC_BUNDLE_URL"
  echo "COPY descriptor.yaml ."
} > Dockerfile

_log_i "Building \"$ENTANDO_OPT_DOCKER_ORG/$ENTANDO_PRJ_IMAGE_NAME:$ENTANDO_PRJ_VERSION\""

docker build -t "$ENTANDO_OPT_DOCKER_ORG/$ENTANDO_PRJ_IMAGE_NAME:$ENTANDO_PRJ_VERSION" .
