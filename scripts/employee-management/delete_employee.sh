#!/bin/bash

echo "========================================"
echo "         Delete Employee"
echo "========================================"

read -p "Enter Employee Name: " username

file=$(find ../employees -type f -name "$username.txt")

if [ -z "$file" ]
then
    echo
    echo "Employee not found!"
    exit 1
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') : Employee $username deleted" >> ../logs/user.log
rm "$file"

echo
echo "Employee deleted successfully!"
