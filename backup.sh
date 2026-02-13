#!/bin/bash

# ==========================================
# Production-Ready Backup Script
# ==========================================

set -e

# Variables
SOURCE_DIR="/home"
BACKUP_DIR="/tmp/backups"
DATE=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_FILE="$BACKUP_DIR/home-backup-$DATE.tar.gz"
LOG_FILE="$BACKUP_DIR/backup.log"

# Function: Log messages
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

# Create backup directory if it does not exist
mkdir -p "$BACKUP_DIR"

log_message "Backup started."

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    log_message "ERROR: Source directory $SOURCE_DIR does not exist."
    exit 1
fi

# Create compressed archive
if tar -czf "$BACKUP_FILE" "$SOURCE_DIR"; then
    log_message "Backup successful: $BACKUP_FILE"
    echo "Backup completed successfully."
else
    log_message "ERROR: Backup failed."
    echo "Backup failed."
    exit 1
fi

log_message "Backup process finished."
