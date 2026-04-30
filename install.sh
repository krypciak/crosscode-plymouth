#!/bin/bash
set -euo pipefail

DIR="$(printf "$(dirname $0)" | xargs realpath)"

check_root() {
  if [ ! $(id -u) -eq 0 ]; then
    echo -e "Must be run as root"
    exit 1
  fi
}

check_root

target_dir="/usr/share/plymouth/themes/crosscode"
echo "copying theme to $target_dir"
rm -rf "$target_dir"
cp -r "$DIR" "$target_dir"

if [ "${1-}" = 'preview' ]; then
  plymouth-set-default-theme -R crosscode
  bash "$DIR"/preview.sh
fi
