#!/bin/bash

# ==============================
# Simple Linux Backup Script
# ==============================

SOURCE_DIR="/home"
BACKUP_DIR="/tmp/backups"
DATE=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_FILE="$BACKUP_DIR/home-backup-$DATE.tar.gz"

# Create backup directory if not exists
mkdir -p "$BACKUP_DIR"

# Create compressed archive
tar -czf "$BACKUP_FILE" "$SOURCE_DIR"

# Check if backup was successful
if [ $? -eq 0 ]; then
    echo "Backup completed successfully!"
    echo "Backup file: $BACKUP_FILE"
else
    echo "Backup failed!"
fi
