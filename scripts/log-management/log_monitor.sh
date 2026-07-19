#!/bin/bash

SYSTEM_LOG="$HOME/TechNova-Server/logs/system.log"
USER_LOG="$HOME/TechNova-Server/logs/user.log"

echo "========================================="
echo "         TechNova Log Monitor"
echo "========================================="

echo
echo "System Log (Last 20 Entries)"
echo "-----------------------------------------"

if [ -f "$SYSTEM_LOG" ]
then
    tail -20 "$SYSTEM_LOG"
else
    echo "System log not found."
fi

echo
echo "User Log (Last 20 Entries)"
echo "-----------------------------------------"

if [ -f "$USER_LOG" ]
then
    tail -20 "$USER_LOG"
else
    echo "User log not found."
fi

echo
echo "Log Statistics"
echo "-----------------------------------------"

[ -f "$SYSTEM_LOG" ] && echo "System Log Lines : $(wc -l < "$SYSTEM_LOG")"
[ -f "$USER_LOG" ] && echo "User Log Lines   : $(wc -l < "$USER_LOG")"

echo
echo "Failed Events"
echo "-----------------------------------------"

grep -i "failed" "$SYSTEM_LOG" "$USER_LOG" 2>/dev/null || echo "No failed events found."
