#!/bin/bash

# Exit on first command failure or undefined var reference
set -eu
set -x

# Return the non-zero exit code of the last cmd of a pipe (or 0 for success)
set -o pipefail

sysctl -w net.ipv4.ip_forward=1
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

