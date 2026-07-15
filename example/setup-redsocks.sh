#!/bin/bash
set -e

# Install dependencies (skip if already present)
which iptables >/dev/null 2>&1 || apt-get update -qq && apt-get install -y -qq iptables
which redsocks >/dev/null 2>&1 || apt-get update -qq && apt-get install -y -qq redsocks

# 1. Configure redsocks
cat >/etc/redsocks.conf <<'EOF'
base {
    log_debug = off;
    log_info = on;
    log = stderr;
    daemon = off;
    redirector = iptables;
}
redsocks {
    local_ip = 127.0.0.1;
    local_port = 12345;
    ip = 127.0.0.1;
    port = 9999;
    type = socks5;
}
EOF

# 2. Setup iptables (handle chain already existing)
iptables -t nat -N REDSOCKS 2>/dev/null || iptables -t nat -F REDSOCKS
iptables -t nat -A REDSOCKS -d 127.0.0.0/8 -j RETURN
iptables -t nat -A REDSOCKS -d 10.0.0.0/8 -j RETURN
iptables -t nat -A REDSOCKS -d 172.16.0.0/12 -j RETURN
iptables -t nat -A REDSOCKS -d 192.168.0.0/16 -j RETURN
iptables -t nat -A REDSOCKS -p tcp -j REDIRECT --to-ports 12345
iptables -t nat -A OUTPUT -p tcp -j REDSOCKS

# 3. Start redsocks
redsocks -c /etc/redsocks.conf &

echo "Redsocks active → SOCKS5 127.0.0.1:9999"
exec "$@"
