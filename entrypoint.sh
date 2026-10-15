#!/bin/bash
set -e
export UNIQUE_ID=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 12)
echo "Initializing instance: $UNIQUE_ID"
rm -rf /root/.opencode/cache/*
rm -f /root/.opencode/tmp/*.lock

if command -v dockerd >/dev/null 2>&1 && [ "$(id -u)" = "0" ]; then
  nohup dockerd >"/var/log/dockerd_$UNIQUE_ID.log" 2>&1 &
  for _ in $(seq 1 30); do
    docker info >/dev/null 2>&1 && break
    kill -0 "$!" 2>/dev/null || break
    sleep 0.5
  done
fi

#sed -i 's/^proxy_dns/#proxy_dns/' /etc/proxychains4.conf
#sed -i 's/^#proxy_dns_old/proxy_dns_old/' /etc/proxychains4.conf
#sleep 2

#timeout 150 proxychains4 -f /etc/proxychains4.conf ping -c 10 myridia.com
#nohup proxychains4 /root/.opencode/bin/opencode >"/var/log/opencode_$UNIQUE_ID.log" 2>&1 &
sleep 2

exec "$@"
