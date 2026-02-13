# Linux Bash Scripts

A small collection of production-style Linux system administration scripts with basic logging and validation.  
Tested in lab environments on Ubuntu/Linux.

## Scripts

### 1) backup.sh
Creates a compressed backup archive of `/home` with a timestamp and writes logs.

**What it does:**
- Creates backup directory if missing
- Validates source directory exists
- Creates `.tar.gz` archive
- Logs actions to a file

**Default paths:**
- Backup directory: `/tmp/backups`
- Log file: `/tmp/backups/backup.log`

---

### 2) disk_monitor.sh
Checks disk usage across mounted filesystems and alerts if usage exceeds a threshold.

**What it does:**
- Scans mounted filesystems
- Compares usage to threshold (default: `80%`)
- Prints warnings and logs results

**Default paths:**
- Log file: `/tmp/backups/disk_monitor.log`

---

### 3) user_create.sh
Creates a Linux user interactively with validation, optional group assignment, and logging.

**What it does:**
- Requires `sudo` / root privileges
- Validates username format
- Creates user with home directory and `/bin/bash`
- Optionally adds user to an existing group
- Prompts to set password
- Logs actions

**Default paths:**
- Log file: `/tmp/backups/user_create.log`

---

## Requirements

- Linux system (Ubuntu/Debian/CentOS etc.)
- Bash shell
- Permissions:
  - `user_create.sh` must be run with `sudo`
  - Others can be run as a normal user (depending on access to directories)

## Setup

Make scripts executable:

```bash
chmod +x backup.sh disk_monitor.sh user_create.sh
