#!/bin/bash

LOG_FILE="$HOME/TechNova-Server/logs/user.log"

echo "========================================="
echo "        Unlock Linux User"
echo "========================================="

read -p "Enter username: " USERNAME

if ! id "$USERNAME" &>/dev/null
then
    echo "User '$USERNAME' does not exist."
    exit 1
fi

sudo usermod -U "$USERNAME"

if [ $? -eq 0 ]
then
    echo "User '$USERNAME' unlocked successfully."

    echo "$(date '+%Y-%m-%d %H:%M:%S') : User $USERNAME unlocked" >> "$LOG_FILE"
else
    echo "Failed to unlock user."
fi
