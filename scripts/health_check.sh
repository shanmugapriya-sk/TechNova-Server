#!/bin/bash
echo "===== System Health Check ====="
echo "Date: $(date)"

echo
echo "Disk Usage"
df -h

echo
echo "Memory Usage"
free -h

echo
echo "CPU Load"
uptime
