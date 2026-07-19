#!/bin/bash

PROJECT_DIR="$HOME/TechNova-Server/projects"
BACKUP_DIR="$HOME/TechNova-Server/backups"
LOG_FILE="$HOME/TechNova-Server/logs/system.log"

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_NAME="projects_backup_$TIMESTAMP.tar.gz"

echo "========================================="
echo "        TechNova Backup System"
echo "========================================="

if [ ! -d "$PROJECT_DIR" ]
then
    echo "Error: Project directory not found!"
    exit 1
fi

mkdir -p "$BACKUP_DIR"

tar -czf "$BACKUP_DIR/$BACKUP_NAME" -C "$HOME/TechNova-Server" projects

if [ $? -eq 0 ]
then
    echo "Backup completed successfully."
    echo "Backup File: $BACKUP_NAME"

    echo "$(date '+%Y-%m-%d %H:%M:%S') : Backup created successfully ($BACKUP_NAME)" >> "$LOG_FILE"
else
    echo "Backup failed!"
    echo "$(date '+%Y-%m-%d %H:%M:%S') : Backup failed" >> "$LOG_FILE"
fi
