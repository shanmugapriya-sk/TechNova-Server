#!/bin/bash

echo "========================================="
echo "         umask Demonstration"
echo "========================================="

echo
echo "Current umask:"
umask

echo
echo "Creating a sample file..."

FILE="$HOME/TechNova-Server/demo_permissions/umask_demo.txt"

touch "$FILE"

echo
echo "Permissions of new file:"
ls -l "$FILE"

echo
echo "Numeric Permissions:"
stat -c "%a" "$FILE"
