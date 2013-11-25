#!/bin/bash

BIN=/usr/local/transmission/bin/transmission-remote

USER=transmission-username
PASS=transmission-username

$BIN -n $USER:$PASS -l | awk -v bin="$BIN" -v auth="$USER:$PASS" '$2 ~ /100%/ || $9 ~ /Finished/ { print bin" -n "auth" -t "$1" -r\0" }' | xargs -0 -I{} sh -c {}
