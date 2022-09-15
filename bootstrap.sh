#!/bin/bash

ulimit -Sn $(ulimit -Hn)
sudo apt-get update
sudo apt-get install -y ansible
