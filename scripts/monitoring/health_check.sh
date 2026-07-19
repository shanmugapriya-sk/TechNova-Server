#!/bin/bash

# ============================================
# TechNova Server Health Monitoring Script
# ============================================

REPORT_DIR="$HOME/TechNova-Server/reports"
LOG_FILE="$HOME/TechNova-Server/logs/system.log"

mkdir -p "$REPORT_DIR"

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
REPORT_FILE="$REPORT_DIR/health_report_$TIMESTAMP.txt"

{
echo "=================================================="
echo "        TechNova Server Health Report"
echo "=================================================="
echo
echo "Date & Time    : $(date)"
echo "Hostname       : $(hostname)"
echo "Operating System : $(lsb_release -ds)"
echo "Kernel Version : $(uname -r)"
echo "System Uptime  : $(uptime -p)"
echo "IP Address     : $(hostname -I)"
echo

echo "=================================================="
echo "           System Resource Usage"
echo "=================================================="
echo

echo "CPU Load"
uptime
echo

echo "Memory Usage"
free -h
echo

echo "Disk Usage"
df -h
echo

echo "=================================================="
echo "        Top 5 CPU Consuming Processes"
echo "=================================================="

ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -6

echo

echo "=================================================="
echo "      Top 5 Memory Consuming Processes"
echo "=================================================="

ps -eo pid,ppid,cmd,%mem --sort=-%mem | head -6
echo

echo "=================================================="
echo "             Service Status"
echo "=================================================="

echo "SSH Service"

systemctl is-active ssh

echo

echo "Cron Service"

systemctl is-active cron

echo
} > "$REPORT_FILE"

echo "$(date '+%Y-%m-%d %H:%M:%S') : Health report generated ($REPORT_FILE)" >> "$LOG_FILE"

echo
echo "Health report generated successfully."
echo "Report Location: $REPORT_FILE"
echo "Health report created successfully."
echo "Report saved to:"
echo "$REPORT_FILE"
