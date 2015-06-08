#!/bin/sh

# Wait until /etc/haproxy.cfg is generated
while [ ! -f /etc/haproxy.cfg ]; do
    echo "Waiting for /etc/haproxy.cfg..."
    sleep 1
done

haproxy -f /etc/haproxy.cfg
