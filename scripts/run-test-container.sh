#!/bin/bash
#
# > ansible-playbook --ask-become-pass -i user@172.17.0.2, playbook.yml

image="ansible-test"
container="$image"

clean() {
    docker rm -f $container
}

trap clean SIGINT

docker build -t $image .

docker run \
    -t \
    --rm \
    --name $container \
    --ip 172.17.0.100 \
    --security-opt seccomp=unconfined \
    --tmpfs /run \
    --tmpfs /run/lock \
    -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
    -v $HOME/.ssh:/home/user/.ssh:ro \
    $image
