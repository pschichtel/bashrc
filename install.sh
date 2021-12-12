#!/usr/bin/env bash

set -eu

here="$(dirname "${BASH_SOURCE[0]}")"

sources=("bash.bashrc" "bashrc.local" "bashrc.local.d" "inputrc.local" "modules-load.d")

for src in "${sources[@]}"
do
    sudo cp -va "${here}/${src}" /etc/
done

