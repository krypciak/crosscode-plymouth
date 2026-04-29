#!/bin/bash
R='\033[1;31m'
B='\033[1;34m'
G='\033[1;32m'

# duration in seconds, default is 10s
duration=$1

if [ $# -ne 1 ]; then
	duration=100
fi

plymouthd --debug
plymouth --show-splash
# plymouth ask-for-password
for ((I=0; I<$duration; I++)); do 
  plymouth system-update --progress=$I
  sleep 0.01
done
plymouth quit
