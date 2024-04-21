#!/usr/bin/env bash

set -euo pipefail

here="$(dirname "${BASH_SOURCE[0]}")"
export GIT_DIR="$here/.git"
export GIT_WORK_TREE="$here"
machine_id="$(< /etc/machine-id)"

perform_install() {
    local from="${1?no from!}"
    local to="${2?no to}"
    shift 2

    if ! [ -d "$from" ]
    then
        return 0
    fi

    find "$from" -type f -exec "$@" bash "$here/install-file.sh" "$from" "$to" "{}" \;
}

perform_install "$here/global" "/" sudo -E
perform_install "$here/$machine_id/global" "/" sudo -E
perform_install "$here/user" "$HOME"
perform_install "$here/$machine_id/user" "$HOME"


