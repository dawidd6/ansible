#!/bin/bash

sudo apt-get update
sudo apt-get install -y \
    ansible \ # for running the playbook, removed later in apt role
    curl git \ # for Homebrew and Ansible, removed later in apt role and replaced in brew role
    build-essential zlib1g-dev # for Homebrew, not removed
