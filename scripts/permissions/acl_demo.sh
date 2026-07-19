#!/bin/bash

DEMO_DIR="$HOME/TechNova-Server/demo_permissions"
DEMO_FILE="$DEMO_DIR/acl_demo.txt"

mkdir -p "$DEMO_DIR"

echo "ACL Demonstration File" > "$DEMO_FILE"

echo "========================================="
echo "         ACL Demonstration"
echo "========================================="

read -p "Enter username to grant access: " USERNAME

if ! id "$USERNAME" &>/dev/null
then
    echo "User '$USERNAME' does not exist."
    exit 1
fi

echo
echo "Granting read and write permissions..."

sudo setfacl -m u:$USERNAME:rw "$DEMO_FILE"

echo
echo "Current ACL Entries:"
getfacl "$DEMO_FILE"

