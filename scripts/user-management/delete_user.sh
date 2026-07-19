#!/bin/bash

LOG_FILE="$HOME/TechNova-Server/logs/user.log"

echo "========================================="
echo "      TechNova User Deletion"
echo "========================================="

echo
read -p "Enter username to delete: " USERNAME

# Check if user exists
if ! id "$USERNAME" &>/dev/null
then
    echo
    echo "User '$USERNAME' does not exist."
    exit 1
fi

echo
read -p "Are you sure you want to delete '$USERNAME'? (y/n): " CONFIRM

if [[ "$CONFIRM" != "y" && "$CONFIRM" != "Y" ]]
then
    echo "Operation cancelled."
    exit 0
fi

sudo userdel -r "$USERNAME"

if [ $? -eq 0 ]
then
    echo
    echo "User '$USERNAME' deleted successfully."

    echo "$(date '+%Y-%m-%d %H:%M:%S') : Linux user $USERNAME deleted" >> "$LOG_FILE"
else
    echo "Failed to delete user."
fi
