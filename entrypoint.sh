#!/bin/bash
set -e
export UNIQUE_ID=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 12)
echo "Initializing instance: $UNIQUE_ID"
rm -rf /root/.opencode/cache/*
rm -f /root/.opencode/tmp/*.lock
nohup proxychains4 /root/.opencode/bin/opencode >"/var/log/opencode_$UNIQUE_ID.log" 2>&1 &
sleep 2
exec "$@"
