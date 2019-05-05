#!/bin/bash

IMAGE_NAME=neuzz

set -x

cd setup/
docker build -t ${IMAGE_NAME}:latest -f Dockerfile .
cd ../

docker run -it --rm \
    --runtime nvidia \
    --mount type=bind,src=$(pwd),dst=/work \
    --net host \
    ${IMAGE_NAME}
