#!/usr/bin/env bash
# install_packages.sh
# Usage: sudo ./install_packages.sh curl git htop
# Description: Cross-distro package installer with logging & error handling.

LOGFILE="$(dirname "$0")/install_packages.log"

# Colors for output
GREEN="\e[32m"
RED="\e[31m"
YELLOW="\e[33m"
RESET="\e[0m"

log() {
  local level="$1"; shift
  local msg="$@"
  local timestamp
  timestamp=$(date +"%Y-%m-%d %H:%M:%S")
  echo -e "${timestamp} [$level] $msg" | tee -a "$LOGFILE"
}

success() { log "${GREEN}SUCCESS${RESET}" "$@"; }
error()   { log "${RED}ERROR${RESET}" "$@"; }
warn()    { log "${YELLOW}WARN${RESET}" "$@"; }

# Require root
if [[ $EUID -ne 0 ]]; then
  error "Please run as root (use sudo)."
  exit 1
fi

# Require at least one package
if [ "$#" -lt 1 ]; then
  error "Usage: $0 package1 package2 ..."
  exit 1
fi

# Detect package manager
if command -v apt >/dev/null 2>&1; then
  PM="apt"
  UPDATE_CMD="apt update -y"
  INSTALL_CMD="apt install -y"
elif command -v dnf >/dev/null 2>&1; then
  PM="dnf"
  UPDATE_CMD="dnf check-update -y"
  INSTALL_CMD="dnf install -y"
elif command -v yum >/dev/null 2>&1; then
  PM="yum"
  UPDATE_CMD="yum check-update -y"
  INSTALL_CMD="yum install -y"
else
  error "Unsupported package manager."
  exit 1
fi

log "INFO" "Detected package manager: $PM"
log "INFO" "Updating package cache..."
if ! $UPDATE_CMD >>"$LOGFILE" 2>&1; then
  error "Failed to update package cache with $PM."
  exit 1
fi

log "INFO" "Installing packages: $*"
if ! $INSTALL_CMD "$@" >>"$LOGFILE" 2>&1; then
  error "Failed to install one or more packages: $*"
  exit 1
fi

success "All requested packages installed successfully."

