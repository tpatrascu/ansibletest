#!/bin/bash

printf '[defaults]\nroles_path=/test' >ansible.cfg
ansible-playbook /test/nginx/tests/test.yml -i /test/nginx/tests/inventory

# test functionality
curl -s http://localhost:8080 | grep -q $(hostname)

if [ $? -eq 0 ]; then
    echo "Test passed"
    exit 0
else
    echo "Test failed" 
    exit 1
fi
