#!/bin/bash

SERVICE=$1

if [ -z "$SERVICE" ]; then
	echo "Usage: ./log_tail.sh <service-name>"
	exit 1
fi

journalctl -u "$SERVICE" -f
