#!/bin/bash
# systrack.sh - Main script to start monitoring

# Set log directory
LOGDIR="/var/log/systrack-lite"
mkdir -p "$LOGDIR"

# Ensure logs are readable
touch "$LOGDIR/commands.log" "$LOGDIR/files.log" "$LOGDIR/programs.log" "$LOGDIR/usb.log"
chmod 644 "$LOGDIR"/*.log

# Start file system watcher (background)
function start_file_watcher() {
    inotifywait -m -r -e create,delete,modify,move /home /mnt /media --format '%T | %w%f | %e' --timefmt '%F %T' \
    >> "$LOGDIR/files.log" &
    echo "[+] File watcher started."
}

# Start USB monitor (background)
function start_usb_logger() {
    udevadm monitor --subsystem-match=usb |
    while read line; do
        echo "$(date '+%F %T') | $line" >> "$LOGDIR/usb.log"
    done &
    echo "[+] USB monitor started."
}

# Extract executed programs from auditd every minute
function start_program_logger() {
    while true; do
        ausearch -k exec_log --format raw | aureport -x --summary | awk 'NR>2' | while read line; do
            echo "$(date '+%F %T') | $line" >> "$LOGDIR/programs.log"
        done
        sleep 60
    done &
    echo "[+] Program execution logger started."
}

# Start all loggers
start_file_watcher
start_usb_logger
start_program_logger

echo "[+] All monitors are now running in the background. Logs are in $LOGDIR."

exit 0
