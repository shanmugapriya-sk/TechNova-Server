#!/bin/bash

echo "========================================="
echo "      TechNova User Information"
echo "========================================="

echo
read -p "Enter username: " USERNAME

# Check user exists
if ! id "$USERNAME" &>/dev/null
then
    echo
    echo "User '$USERNAME' does not exist."
    exit 1
fi

echo
echo "User Details"
echo "------------------------------"

echo "Username       : $USERNAME"
echo "UID            : $(id -u $USERNAME)"
echo "GID            : $(id -g $USERNAME)"
echo "Groups         : $(groups $USERNAME)"
echo "Home Directory : $(getent passwd $USERNAME | cut -d: -f6)"
echo "Login Shell    : $(getent passwd $USERNAME | cut -d: -f7)"

echo
echo "Password Expiry Information"
echo "------------------------------"

sudo chage -l "$USERNAME"
