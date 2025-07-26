#!/bin/bash
# setup.sh - Installer for Sumahim SysTrack-Lite

set -e

# Check for root
if [[ $EUID -ne 0 ]]; then
   echo "[!] This script must be run as root." 
   exit 1
fi

echo "[+] Installing dependencies..."

# Install inotify-tools and auditd if missing
if ! command -v inotifywait >/dev/null 2>&1; then
    apt-get update && apt-get install -y inotify-tools
fi

if ! command -v auditctl >/dev/null 2>&1; then
    apt-get update && apt-get install -y auditd
    systemctl enable auditd && systemctl start auditd
fi

# Create log directory
mkdir -p /var/log/systrack-lite
chmod 755 /var/log/systrack-lite

# Setup auditd rule for execve tracking
if ! auditctl -l | grep -q "exec_log"; then
    echo "[+] Adding auditd rule for executed commands..."
    auditctl -a always,exit -F arch=b64 -S execve -k exec_log
fi

# Ensure aureport is installed (usually part of auditd)
if ! command -v aureport >/dev/null 2>&1; then
    apt-get install -y auditd
fi

# Confirm setup completion
echo "[✓] Setup complete. You can now run systrack.sh to begin monitoring."
echo "    → Run: sudo bash systrack.sh"
