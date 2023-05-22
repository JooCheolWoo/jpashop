#!/bin/bash
# shellcheck disable=SC2154
# shellcheck disable=SC1091
source ./yaml.sh

# Execute
create_variables ./src/main/resources/application.yml
echo ${server_version}

APP_NAME="jpashop"

# current docker container stop
docker stop ${APP_NAME}
# container remove
docker rm ${APP_NAME}
# image remove
docker rmi ${APP_NAME}:${server_version}
# build to a Docker daemon
gradle build --exclude-task test
# build docker
docker build -t ${APP_NAME}:${server_version} .
# docker run
docker run -d -p ${PORT}:${PORT} -v /etc/localtime:/etc/localtime:ro -e TZ=Asia/Seoul -e "ACTIVE=${ACTIVE}" -e "CORS_LIST=${CORS_LIST}" -e "AWS_ACCESS_KEY=${AWS_ACCESS_KEY}" -e "AWS_SECRET_KEY=${AWS_SECRET_KEY}" --restart unless-stopped --network ${NETWORK} --name ${APP_NAME} ${APP_NAME}:${server_version}
