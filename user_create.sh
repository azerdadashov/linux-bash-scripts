#!/bin/bash

# ==============================
# User Creation Script
# ==============================

read -p "Enter username to create: " USERNAME

if id "$USERNAME" &>/dev/null; then
    echo "User already exists!"
else
    sudo useradd -m "$USERNAME"
    sudo passwd "$USERNAME"
    echo "User $USERNAME created successfully."
fi
