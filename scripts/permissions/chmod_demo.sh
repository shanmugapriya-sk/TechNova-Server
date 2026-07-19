#!/bin/bash

DEMO_DIR="$HOME/TechNova-Server/demo_permissions"
DEMO_FILE="$DEMO_DIR/sample.txt"

mkdir -p "$DEMO_DIR"

echo "Linux Permission Demo" > "$DEMO_FILE"

echo "========================================="
echo "        chmod Demonstration"
echo "========================================="

echo
echo "Initial Permissions:"
ls -l "$DEMO_FILE"

echo
echo "Applying chmod 755..."

chmod 755 "$DEMO_FILE"

echo
echo "Updated Permissions:"
ls -l "$DEMO_FILE"

echo
echo "Numeric Permission:"
stat -c "%a" "$DEMO_FILE"
