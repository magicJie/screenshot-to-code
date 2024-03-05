#!/bin/bash
set -e

if [ -n "$1" ] ;then
    tag="$1"
else
    tag=latest
fi
image=swr.lan.aiminjie.com/amj/stc-frontend
docker build -t $image:$tag ./frontend --build-arg https_proxy=http://10.0.1.116:20172
docker push $image:$tag

image=swr.lan.aiminjie.com/amj/stc-backend
docker build -t $image:$tag ./backend --build-arg https_proxy=http://10.0.1.116:20172
docker push $image:$tag
