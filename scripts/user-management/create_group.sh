#!/bin/bash

LOG_FILE="$HOME/TechNova-Server/logs/user.log"

echo "========================================="
echo "      TechNova Group Management"
echo "========================================="

echo
read -p "Enter group name: " GROUPNAME

if [ -z "$GROUPNAME" ]
then
    echo "Group name cannot be empty!"
    exit 1
fi

if getent group "$GROUPNAME" > /dev/null
then
    echo
    echo "Group '$GROUPNAME' already exists."
    exit 1
fi

sudo groupadd "$GROUPNAME"

if [ $? -eq 0 ]
then
    echo
    echo "Group '$GROUPNAME' created successfully."

    echo "$(date '+%Y-%m-%d %H:%M:%S') : Linux group $GROUPNAME created" >> "$LOG_FILE"
else
    echo "Failed to create group."
fi
