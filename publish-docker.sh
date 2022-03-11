#!/bin/sh

docker buildx build --platform linux/amd64 -t alisaqaq/maa-download-server-runtime-environment:$1-amd64 .
docker buildx build --platform linux/arm64 -t alisaqaq/maa-download-server-runtime-environment:$1-arm64 .
docker buildx build --platform linux/arm/v7 -t alisaqaq/maa-download-server-runtime-environment:$1-arm-v7 .

docker image push --all-tags alisaqaq/maa-download-server-runtime-environment

docker manifest create alisaqaq/maa-download-server-runtime-environment:$1 \
    alisaqaq/maa-download-server-runtime-environment:$1-amd64 \
    alisaqaq/maa-download-server-runtime-environment:$1-arm64 \
    alisaqaq/maa-download-server-runtime-environment:$1-arm-v7

docker manifest push alisaqaq/maa-download-server-runtime-environment:$1

docker manifest create alisaqaq/maa-download-server-runtime-environment:latest \
    alisaqaq/maa-download-server-runtime-environment:$1-amd64 \
    alisaqaq/maa-download-server-runtime-environment:$1-arm64 \
    alisaqaq/maa-download-server-runtime-environment:$1-arm-v7

docker manifest push alisaqaq/maa-download-server-runtime-environment:latest
