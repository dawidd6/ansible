#!/bin/bash

sudo apt-get update
sudo apt-get install -y \
    # for running the playbook, removed later in apt role
    ansible \
    # for Homebrew and Ansible, removed later in apt role and replaced in brew role
    curl git \
    # for Homebrew, not removed
    build-essential zlib1g-dev
