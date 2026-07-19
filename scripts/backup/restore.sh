#!/bin/bash

BACKUP_DIR="$HOME/TechNova-Server/backups"
RESTORE_DIR="$HOME/TechNova-Server"

echo "========================================="
echo "       TechNova Restore System"
echo "========================================="

echo
echo "Available Backups:"
ls -1 "$BACKUP_DIR"/*.tar.gz 2>/dev/null

echo
read -p "Enter backup filename: " BACKUP_FILE

if [ ! -f "$BACKUP_DIR/$BACKUP_FILE" ]
then
    echo "Backup file not found!"
    exit 1
fi

tar -xzf "$BACKUP_DIR/$BACKUP_FILE" -C "$RESTORE_DIR"

if [ $? -eq 0 ]
then
    echo
    echo "Restore completed successfully."

    echo "$(date '+%Y-%m-%d %H:%M:%S') : Restored $BACKUP_FILE" >> "$HOME/TechNova-Server/logs/system.log"
else
    echo "Restore failed!"
fi
