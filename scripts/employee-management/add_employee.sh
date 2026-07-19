#!/bin/bash 
echo "====================================="
echo "    TechNova Employee Management"

echo "====================================="

read -p "Enter Employee Name: " username

if [ -f "../employees/developers/$username.txt" ] || \
[ -f "../employees/testers/$username.txt" ] || \
[ -f "../employees/admins/$username.txt" ] 
then
echo 
echo "Employee already exixts!"
exit 1
fi
echo 
echo "select department"
echo "1. developers"
echo "2. testers"
echo "3. admins"

read -p " enter your choice:" ch

case $ch in

1)
department="developers"
;;
2)
department="testers"
;;
3)
department="admins"
;;
*)
echo "invalid"
exit 1
;;
esac
echo "Employee Name  : $username"
echo "Department     : $department"
mkdir -p ../employees/$department
filepath="../employees/$department/$username.txt"

echo "Employee Name : $username" > "$filepath"
echo "Department    : $department" >> "$filepath"
echo "Created On    : $(date)" >> "$filepath"

echo "$(date '+%Y-%m-%d %H:%M:%S') : Employee $username added to $department" >> ../logs/user.log
echo ""
echo "Employee added Sucessfully."
echo "Saved to: $filepath"
