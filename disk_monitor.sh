#!/bin/bash

# ==========================================
# Production-Ready Disk Monitoring Script
# ==========================================

set -e

THRESHOLD=80
LOG_FILE="/tmp/backups/disk_monitor.log"

# Function: Log messages
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

log_message "Disk monitoring started."

# Check all mounted filesystems except tmpfs/devtmpfs
df -h --output=target,pcent | tail -n +2 | while read mount usage; do
    usage_percent=$(echo "$usage" | tr -d '%')

    if [ "$usage_percent" -ge "$THRESHOLD" ]; then
        log_message "WARNING: $mount is at $usage"
        echo "WARNING: $mount usage is $usage"
    else
        log_message "OK: $mount is at $usage"
    fi
done

log_message "Disk monitoring finished."
