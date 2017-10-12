#!/bin/bash

BASE_FOLDER=base
CURRENT_PATH=$(pwd)

# Function to build images for folders where the Dockerfile is at the top level.
# This is the case for the base and languages for which only a single version is supported.
build_generic() {
  FOLDER=$1
  cd $FOLDER

  REGISTRY=coursemology
  IMAGE_NAME=$REGISTRY/evaluator-image-$FOLDER

  echo "IN $(pwd)"
  echo "Building $IMAGE_NAME"

  docker build -t $IMAGE_NAME .

  cd $CURRENT_PATH
}

# Build the base docker image first.
build_generic $BASE_FOLDER

for f in $(pwd)/*;
  do
    if [ ! -d $f ]; then
      continue
    fi

    FOLDER_NAME=`basename $f`

    # This is the folder with the Dockerfile for the base image. Skip it since it has already been built
    if [ $FOLDER_NAME == $BASE_FOLDER ]; then
      continue
    fi

    # Look for build.sh in the folder, if it doesn't exist use the generic build method.
    if [ -f $f/build.sh ]; then
      cd $f
      bash $f/build.sh
    else
      build_generic $FOLDER_NAME
    fi
  done;
