#!/bin/bash

LOG_FILE="$HOME/TechNova-Server/logs/user.log"

echo "========================================="
echo "         Lock Linux User"
echo "========================================="

read -p "Enter username: " USERNAME

if ! id "$USERNAME" &>/dev/null
then
    echo "User '$USERNAME' does not exist."
    exit 1
fi

sudo usermod -L "$USERNAME"

if [ $? -eq 0 ]
then
    echo "User '$USERNAME' locked successfully."

    echo "$(date '+%Y-%m-%d %H:%M:%S') : User $USERNAME locked" >> "$LOG_FILE"
else
    echo "Failed to lock user."
fi
