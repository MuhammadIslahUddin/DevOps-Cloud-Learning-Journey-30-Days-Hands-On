# Day 8 – Linux Package Management

## 📌 Overview
Day 8 focused on **Linux package management** across different distributions.  
We explored how to install, update, remove, and clean packages using both manual commands and automation scripts.  

The goal was to make reusable, professional scripts for package operations with logging and error handling.

---

## 📂 Scripts

### 1. `install_packages.sh`
- **Purpose:** Install one or more packages automatically.
- **Features:**
  - Detects package manager (`apt`, `dnf`, or `yum`)
  - Updates package cache before install
  - Error handling with clear messages
  - Logs actions to `install_packages.log`
  - Color-coded output (green = success, red = error, yellow = warn)

**Usage:**
```bash
sudo ./install_packages.sh curl git htop
