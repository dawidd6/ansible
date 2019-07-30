#!/bin/bash

export ANSIBLE_HOST_KEY_CHECKING=False
ansible-playbook -K -i user@172.17.0.100, "$1"