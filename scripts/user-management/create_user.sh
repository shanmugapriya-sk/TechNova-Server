#!/bin/bash

LOG_FILE="$HOME/TechNova-Server/logs/user.log"

echo "========================================="
echo "      TechNova User Management"
echo "========================================="

echo
read -p "Enter new username: " USERNAME

# Check if username is empty
if [ -z "$USERNAME" ]
then
    echo "Username cannot be empty!"
    exit 1
fi

# Check whether user already exists
if id "$USERNAME" &>/dev/null
then
    echo
    echo "User '$USERNAME' already exists."
    exit 1
fi

# Create user
sudo useradd -m "$USERNAME"

# Check creation status
if [ $? -eq 0 ]
then
    echo
    echo "User '$USERNAME' created successfully."

    echo "Set password for $USERNAME"

    sudo passwd "$USERNAME"

    echo "$(date '+%Y-%m-%d %H:%M:%S') : Linux user $USERNAME created" >> "$LOG_FILE"

else
    echo "Failed to create user."
fi
