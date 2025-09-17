#!/usr/bin/env bash
# cleanup_packages.sh - Clean up unused packages and caches

set -euo pipefail

LOG_FILE="cleanup_packages.log"

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

log "INFO" "Cleaning package caches and unused dependencies..."
case "$PM" in
    apt)
        sudo apt autoremove -y &>>"$LOG_FILE" || log "ERROR" "Failed to autoremove."
        sudo apt clean -y &>>"$LOG_FILE" || log "ERROR" "Failed to clean cache."
        ;;
    dnf|yum)
        sudo "$PM" autoremove -y &>>"$LOG_FILE" || log "ERROR" "Failed to autoremove."
        sudo "$PM" clean all -y &>>"$LOG_FILE" || log "ERROR" "Failed to clean cache."
        ;;
esac

log "SUCCESS" "Cleanup completed successfully."
