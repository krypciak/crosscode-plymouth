#!/bin/bash
set -euo pipefail
check_root () {
  if [ ! $( id -u ) -eq 0 ]; then
    echo -e $R"Must be run as root"
    exit
  fi
}

check_root

cp -r /home/krypek/Temp/crosscode/ /usr/share/plymouth/themes/ 
plymouth-set-default-theme -R crosscode 

if [ "${1-}" != '' ]; then
  sh preview.sh
fi
