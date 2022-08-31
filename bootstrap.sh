#!/bin/bash

set -euo pipefail

sudo apt-get update
sudo apt-get install \
    ansible build-essential procps curl file git zlib1g-dev
