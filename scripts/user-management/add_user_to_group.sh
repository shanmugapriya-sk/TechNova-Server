#!/bin/bash

LOG_FILE="$HOME/TechNova-Server/logs/user.log"

echo "========================================="
echo "      Add User To Group"
echo "========================================="

echo
read -p "Enter username: " USERNAME
read -p "Enter group name: " GROUPNAME

if ! id "$USERNAME" &>/dev/null
then
    echo "User '$USERNAME' does not exist."
    exit 1
fi

if ! getent group "$GROUPNAME" >/dev/null
then
    echo "Group '$GROUPNAME' does not exist."
    exit 1
fi

sudo usermod -aG "$GROUPNAME" "$USERNAME"

if [ $? -eq 0 ]
then
    echo
    echo "User '$USERNAME' added to group '$GROUPNAME' successfully."

    echo "$(date '+%Y-%m-%d %H:%M:%S') : Added $USERNAME to group $GROUPNAME" >> "$LOG_FILE"
else
    echo "Failed to add user to group."
fi
