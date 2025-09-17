cat > docs/day8-package-management.md <<'EOF'
# Day 8 — Package Management (Linux)

## Objectives
- Understand package managers for Debian/Ubuntu (apt, apt-get, dpkg) and for RHEL/CentOS (yum, dnf, rpm).
- Install, remove, search, list installed packages.
- Check for updates and automate simple package tasks.
- Clean package caches and recover from common failures.

---

## Quick reference commands

### Debian/Ubuntu (apt)
- Update package lists:
  sudo apt update
- Upgrade packages:
  sudo apt upgrade
- Install package:
  sudo apt install <package>
- Remove package (keep config):
  sudo apt remove <package>
- Purge package (remove config too):
  sudo apt purge <package>
- List upgradable:
  apt list --upgradable
- Show package info:
  apt show <package>
- Low-level tool (single .deb):
  sudo dpkg -i package.deb
- Fix broken deps:
  sudo apt --fix-broken install
- Clean caches:
  sudo apt autoremove
  sudo apt autoclean
  sudo apt clean

Notes:
- Use `DEBIAN_FRONTEND=noninteractive` in automation to avoid interactive prompts.
- `apt` is a friendlier wrapper for `apt-get`/`dpkg`.

### RHEL/CentOS (yum/dnf)
- Update metadata:
  sudo yum makecache   # (or dnf makecache)
- Check for updates:
  sudo yum check-update
- Install:
  sudo yum install -y <package>
- Remove:
  sudo yum remove <package>
- Clean caches:
  sudo yum autoremove
  sudo yum clean all
- Low-level package:
  sudo rpm -ivh package.rpm

### Search packages
- apt:
  apt search <term>
- yum:
  yum search <term>

### List installed packages
- Debian/Ubuntu:
  dpkg -l | grep '^ii'
- RHEL/CentOS:
  rpm -qa

---

## Scripting tips (non-interactive installs)
- For apt:
  DEBIAN_FRONTEND=noninteractive sudo apt install -y <package1> <package2>
- For yum/dnf:
  sudo yum install -y <package1> <package2>

---

## Automation exercises (this day)
1. Use the `install_packages.sh` script to install `curl git htop`.
2. Use `check_updates.sh` to show upgradable packages.
3. Use `cleanup_packages.sh` to remove unused packages and clean caches.

---

## Troubleshooting
- "Could not get lock /var/lib/dpkg/lock-frontend": another package process running. Wait or:
  sudo killall apt apt-get
  sudo rm /var/lib/dpkg/lock-frontend /var/cache/apt/archives/lock
  sudo dpkg --configure -a

- Broken dependencies after dpkg -i:
  sudo apt --fix-broken install

- Network/DNS errors: check /etc/resolv.conf and `ping 8.8.8.8` and `curl -I https://deb.debian.org`.

---

## Extensions
- Create an Ansible playbook that ensures a list of packages is installed.
- Build a small local apt repository or a private YUM repo (useful for internal images).
- Create a systemd timer that runs `check_updates.sh` daily and emails a summary (requires mail utils).

EOF
