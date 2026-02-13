#!/bin/bash

# ==============================
# Disk Usage Monitoring Script
# ==============================

THRESHOLD=80
CURRENT_USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

echo "Current disk usage: $CURRENT_USAGE%"

if [ "$CURRENT_USAGE" -gt "$THRESHOLD" ]; then
    echo "WARNING: Disk usage exceeded $THRESHOLD%!"
else
    echo "Disk usage is within normal limits."
fi
