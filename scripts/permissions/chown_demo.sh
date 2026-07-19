#!/bin/bash

DEMO_DIR="$HOME/TechNova-Server/demo_permissions"
DEMO_FILE="$DEMO_DIR/owner_demo.txt"

mkdir -p "$DEMO_DIR"

echo "Ownership Demo" > "$DEMO_FILE"

echo "========================================="
echo "        chown Demonstration"
echo "========================================="

echo
echo "Current Ownership:"
ls -l "$DEMO_FILE"

echo
read -p "Enter new owner username: " OWNER

if ! id "$OWNER" &>/dev/null
then
    echo "User '$OWNER' does not exist."
    exit 1
fi

sudo chown "$OWNER":"$OWNER" "$DEMO_FILE"

echo
echo "Updated Ownership:"
ls -l "$DEMO_FILE"
