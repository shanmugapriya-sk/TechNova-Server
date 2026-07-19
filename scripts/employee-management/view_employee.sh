#!/bin/bash

echo "========================================"
echo "       View Employee Details"
echo "========================================"

read -p "Enter Employee Name: " username

file=$(find ../employees -type f -name "$username.txt")

if [ -z "$file" ]
then
    echo
    echo "Employee not found!"
    exit 1
fi

echo
echo "Employee Details"
echo "----------------"
cat "$file"
