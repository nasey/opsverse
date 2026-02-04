#!/bin/bash

echo "===LOAD==="
uptime
echo

echo "===MEMORY==="
free -h
echo

echo "===DISK==="
df -h
echo

echo "===PORTS==="
ss -lnt
