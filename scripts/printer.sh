#!/bin/bash

set -euo pipefail

url="https://download.brother.com/welcome/dlf006893/linux-brprinter-installer-2.2.1-1.gz"

cd /tmp
curl --silent "$url" | gunzip | sudo bash
