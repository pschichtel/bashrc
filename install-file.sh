#!/usr/bin/env bash

set -euo pipefail

source_tree="${1?no source tree!}"
target_tree="${2?no target tree!}"
source_file="${3?no source file!}"

if ! [ -r "$source_file" ]
then
    echo "Unable to read file $source_file!" >&2
    exit 1
fi

relative_file="$(realpath -s --relative-to="$source_tree" "$source_file")"
target_file="${target_tree%/}/$relative_file"
target_file_parent="$(dirname "$target_file")"

mkdir -p "$target_file_parent"
echo "$target_file_parent -> $target_file"

if [ -e "$target_file" ]
then
    echo "Existing file"
    #md5sum "$source_file" "$target_file"
else
    echo "New file!"
fi

cp -v -a "$source_file" "$target_file"
