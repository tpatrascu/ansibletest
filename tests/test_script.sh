#!/bin/bash

set -euxo pipefail

printf '[defaults]\nroles_path=/test' >ansible.cfg
ansible-playbook /test/nginx/tests/test.yml -i /test/nginx/tests/inventory

# test functionality
curl -s http://localhost:8080 | grep -q $(hostname)

if [ $? -eq 0 ]; then
    echo "Test passed"
else
    echo "Test failed"
fi
