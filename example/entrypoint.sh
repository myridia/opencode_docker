#!/bin/bash
# 1. Start redsocks (to handle the SOCKS5 wrapping)
redsocks -c /etc/redsocks.conf &

# 2. Apply the iptables rule
iptables -t nat -A OUTPUT -p tcp --dport 443 -j REDIRECT --to-ports 12345

# 3. Execute the command passed to the container
exec "$@"
