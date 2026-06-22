#!/bin/bash
# this will work only on X11!

if [ "${WAYLAND_DISPLAY-}" != "" ]; then
  echo "this doesn't work in wayland!"
  exit 1
fi

if [ "$(whoami)" != "root" ]; then
  echo "this has to be run as root!";
  exit 2
fi

R='\033[1;31m'
B='\033[1;34m'
G='\033[1;32m'

# duration in 1/100 of a seconds, default is 1s
duration=$1

if [ $# -ne 1 ]; then
	duration=100
fi

plymouthd --debug
plymouth --show-splash
plymouth change-mode --reboot
# plymouth ask-for-password
for ((I=0; I<$duration; I++)); do 
  # plymouth system-update --progress=$I
  sleep 0.01
done
plymouth quit
