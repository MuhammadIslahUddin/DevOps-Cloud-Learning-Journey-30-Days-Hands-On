#!/usr/bin/env bash
# check_updates.sh - Check for available package updates

set -euo pipefail

LOG_FILE="check_updates.log"

# Colors
GREEN="\e[32m"
RED="\e[31m"
YELLOW="\e[33m"
NC="\e[0m"

log() {
    local level="$1"; shift
    local msg="$*"
    local ts
    ts=$(date +"%Y-%m-%d %H:%M:%S")
    echo -e "${ts} [${level}] ${msg}" | tee -a "$LOG_FILE"
}

# Detect package manager
detect_pm() {
    if command -v apt >/dev/null 2>&1; then
        echo "apt"
    elif command -v dnf >/dev/null 2>&1; then
        echo "dnf"
    elif command -v yum >/dev/null 2>&1; then
        echo "yum"
    else
        log "ERROR" "No supported package manager found."
        exit 1
    fi
}

PM=$(detect_pm)
log "INFO" "Detected package manager: $PM"

log "INFO" "Refreshing package cache..."
if ! sudo "$PM" -qq update -y &>>"$LOG_FILE"; then
    log "ERROR" "Failed to update package cache."
    exit 1
fi

log "INFO" "Checking for available updates..."
case "$PM" in
    apt)
        UPDATES=$(apt list --upgradable 2>/dev/null | tail -n +2)
        ;;
    dnf|yum)
        UPDATES=$(yum check-update || true)
        ;;
esac

if [[ -z "$UPDATES" ]]; then
    log "SUCCESS" "No updates available. System is up to date."
else
    log "INFO" "Updates available:"
    echo "$UPDATES" | tee -a "$LOG_FILE"
fi
