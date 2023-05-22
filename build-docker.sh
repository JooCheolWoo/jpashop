#!/bin/bash
# shellcheck disable=SC2154
# shellcheck disable=SC1091
source ./yaml.sh

# Execute
create_variables ./src/main/resources/application.yml

APP_NAME="jpashop"

# current docker container stop
docker stop ${APP_NAME}
# container remove
docker rm ${APP_NAME}
# image remove
docker rmi ${APP_NAME}
# build to a Docker daemon
gradle build --exclude-task test
# build docker
docker build -t ${APP_NAME} .
# docker run
docker run -d -p 10252:10252 --restart unless-stopped --name ${APP_NAME} ${APP_NAME}
