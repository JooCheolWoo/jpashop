#!/bin/bash

# current docker container stop
docker stop jpashop
# container remove
docker rm jpashop
# image remove
docker rmi jpashop
# build to a Docker daemon
gradle build --exclude-task test
# build docker
docker build -t jpashop .
# docker run
docker run -d -p 10252:10252 --restart unless-stopped --name jpashop jpashop
