#!/bin/bash

REGISTRY=coursemology
NAME_SUFFIX=`basename $(pwd)`
NAME=evaluator-image-$NAME_SUFFIX
IMAGE_NAME=$REGISTRY/$NAME

build() {
  TAG=$1
  IMAGE_NAME=$REGISTRY/$NAME:$TAG

  echo "IN $(pwd)"
  echo "Building $IMAGE_NAME"

  docker build --platform linux/x86_64 -t $IMAGE_NAME .
}

# Iterate over all active C++ folders and build with tag X
for f in $(pwd)/*;
  do
    if [ -d $f ]; then
      cd "$f"
      FOLDER_NAME=`basename $f`
      if [[ $FOLDER_NAME == legacy* ]]; then
        continue
      fi
      build ${FOLDER_NAME:3}
    fi
  done;
