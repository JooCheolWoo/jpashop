#!/bin/bash
# move to project folder
cd /home/cheolwoo/jpashop
git reset
git checkout .
git clean -fdx
git pull
# execute docker build
/bin/bash build-docker.sh