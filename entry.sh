#!/bin/sh

# Try to enable BBR (may not work in container, no harm trying)
echo "bbr" > /proc/sys/net/ipv4/tcp_congestion_control 2>/dev/null || true
echo "fq" > /proc/sys/net/core/default_qdisc 2>/dev/null || true

# Enable TCP Fast Open
echo 3 > /proc/sys/net/ipv4/tcp_fastopen 2>/dev/null || true

# Show current congestion control
CUR_CC=$(cat /proc/sys/net/ipv4/tcp_congestion_control 2>/dev/null || echo "unknown")
echo "TCP congestion control: $CUR_CC"

# Start xray
exec /xray -c /config.json
