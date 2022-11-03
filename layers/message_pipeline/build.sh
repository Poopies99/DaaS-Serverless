#!/bin/bash -x

set -euo pipefail

chmod +x build.sh

cd libs

rm -rf build
docker build -t serverless-daas-python-requirements-layer .
CONTAINER=$(docker run -d serverless-daas-python-requirements-layer false)
docker cp $CONTAINER:/var/task build
docker rm $CONTAINER
