#!/bin/bash

# ==========================================
# Production-Ready User Creation Script
# ==========================================

set -e

LOG_FILE="/tmp/backups/user_create.log"

log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root (use sudo)."
    exit 1
fi

read -p "Enter username to create: " USERNAME

# Validate username (basic)
if [[ ! "$USERNAME" =~ ^[a-z_][a-z0-9_-]*$ ]]; then
    echo "Invalid username. Use lowercase letters, numbers, underscore, hyphen."
    exit 1
fi

# Check if user already exists
if id "$USERNAME" &>/dev/null; then
    echo "User '$USERNAME' already exists."
    log_message "INFO: User '$USERNAME' already exists."
    exit 0
fi

# Optional group
read -p "Enter group to add user (leave empty to skip): " GROUP

# Create user
useradd -m -s /bin/bash "$USERNAME"
log_message "INFO: User '$USERNAME' created."

# Add to group if provided
if [ -n "$GROUP" ]; then
    if getent group "$GROUP" >/dev/null; then
        usermod -aG "$GROUP" "$USERNAME"
        log_message "INFO: User '$USERNAME' added to group '$GROUP'."
    else
        echo "Group '$GROUP' does not exist. Skipping group assignment."
        log_message "WARN: Group '$GROUP' does not exist. Skipped."
    fi
fi

# Set password
echo "Set password for '$USERNAME':"
passwd "$USERNAME"
log_message "INFO: Password set for user '$USERNAME'."

echo "User '$USERNAME' created successfully."
log_message "DONE: User '$USERNAME' provisioning finished."
