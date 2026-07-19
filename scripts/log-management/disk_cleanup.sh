#!/bin/bash

REPORT_DIR="$HOME/TechNova-Server/reports"
BACKUP_DIR="$HOME/TechNova-Server/backups"

echo "========================================="
echo "         Disk Cleanup Utility"
echo "========================================="

echo
echo "Deleting report files older than 7 days..."

find "$REPORT_DIR" -type f -mtime +7 -delete

echo "Deleting backup archives older than 30 days..."

find "$BACKUP_DIR" -type f -name "*.tar.gz" -mtime +30 -delete

echo
echo "Cleanup completed successfully."
