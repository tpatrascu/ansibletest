#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname "$0")"; pwd)

container_id=$(docker run --privileged --rm -tid -v ${SCRIPT_DIR}/../:/test/nginx quay.io/ansible/toolset /sbin/init)

docker exec -ti ${container_id} /test/nginx/tests/test_script.sh

docker stop ${container_id}
